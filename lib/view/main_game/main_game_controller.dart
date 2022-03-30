import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:dop_xtel/common/core/base_controller.dart';
import 'package:dop_xtel/common/local_storage/hive_module.dart';
import 'package:dop_xtel/common/local_storage/load_json_local.dart';
import 'package:dop_xtel/common/module/ad_banner_listener.dart';
import 'package:dop_xtel/common/module/ad_helper.dart';
import 'package:dop_xtel/common/module/ad_interstitial_ads_listerner.dart';
import 'package:dop_xtel/common/module/ad_rewarded_ads_listerner.dart';
import 'package:dop_xtel/system/model/draw_hint/hint.dart';
import 'package:dop_xtel/system/model/drawn_line.dart';
import 'package:dop_xtel/system/model/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/src/ad_containers.dart';
import 'package:image/image.dart' as img;

import '../../common/export_this.dart';

class MainGameController extends BaseController
    with
        WidgetsBindingObserver,
        AdBannerListener,
        AdRewardedAdsListener,
        AdInterstitialAdsListener {
  var isWin = false.obs;
  var isShowConfetti = false.obs;
  var isShowComplete = false.obs;
  var isLoadAds = false.obs;
  var isShowHint = false.obs;
  var isNext = false.obs;
  var line = DrawnLine().obs;
  var lines = <DrawnLine>[].obs;

  List collisionList = [];
  List truePointDraw = [];
  List truePointCheckRatio = [];
  List truePointCheck = [];

  GlobalKey keyImage = GlobalKey();
  var offsetImage = const Offset(0, 0).obs;
  var gameLoad = Game().obs;

  var isPhone = true.obs;
  var isVolume = true.obs;
  var isMusic = true.obs;
  var isShowSetting = false.obs;

  List gameList = <Game>[];

  var photo = Rxn();
  double ratioImage = 1;

  @override
  Future<void> initialData() async {
    WidgetsBinding.instance!.addObserver(this);
    await firstTimeGame();
    await getGameList();
    gameLoad.value = Game.fromJson(HiveModule.getValue('LoadLevel', Game()));
    await getRatioImage(gameLoad.value);
    await getTruePointDraw(gameLoad.value);
    await audioBackground();
    log("RESUME $isMusic");

    isMusic.value ? audioCacheBackground.loop(pathBackground) : null;
    audioButton();
    audioLevelComplete();
    return super.initialData();
  }

  //------------------------------------- Lan dau vao game
  Future<void> firstTimeGame() async {
    if (HiveModule.getValue('LoadLevel', Game()) == null) {
      await HiveModule.putValue(
          'LoadLevel',
          Game(
            id: 1,
            nameLevel: 'Level 1',
            isPlayed: true,
            imageFail: 'assets/image/lv1_fail.png',
            imageSuccess: 'assets/image/lv1_success.png',
            jsonHint: 'assets/json/level1.json',
            difficultyLevel: 0,
          ));

      await HiveModule.putValue(
        'phone',
        true,
      );
      await HiveModule.putValue(
        'volume',
        true,
      );
      await HiveModule.putValue(
        'music',
        true,
      );
    }
  }

  //------------------------------ True point de ve

  Future<void> getTruePointDraw(Game gameLoad) async {
    log('AAAAAAAA $ratioImage');
    truePointDraw.clear();
    Hint hint = Hint.fromJson(
        json.decode(await LoadJsonLocal.getJson(localJson: gameLoad.jsonHint)));
    hint.truePoint?.forEach((element) {
      truePointDraw.add([
        Offset((element.point![0].x! / ratioImage),
            (element.point![0].y! / ratioImage)),
        Offset((element.point![1].x! / ratioImage),
            (element.point![1].y! / ratioImage))
      ]);
    });
  }

  //------------------------------ Danh sach level

  Future<void> getGameList() async {
    if (HiveModule.getValue('AllLevel', Game()) == null) {
      for (int i = 1; i <= 8; i++) {
        gameList.add(Game(
          id: i,
          nameLevel: 'Level $i',
          isPlayed: true,
          imageFail: 'assets/image/lv${i}_fail.png',
          imageSuccess: 'assets/image/lv${i}_success.png',
          jsonHint: 'assets/json/level$i.json',
          difficultyLevel: i != 1 ? 1 : 0,
        ));
        await HiveModule.putValue(
          'AllLevel',
          gameList,
        );
      }
    }

    isPhone.value = HiveModule.getValue('phone', true);
    isVolume.value = HiveModule.getValue('volume', true);
    isMusic.value = HiveModule.getValue('music', true);

    gameList.clear();
    List game = HiveModule.getValue('AllLevel', Game());
    for (var element in game) {
      gameList.add(Game.fromJson(element));
    }
  }

  //------------------------------ Check va cham

  void checkListCollide(Offset x) {
    List listCollide = getCollide(x);
    log("LIST VA CHam $listCollide");
    if (listCollide != []) {
      if (listCollide.isNotEmpty) {
        if (!collisionList.contains(listCollide)) {
          collisionList.add(listCollide);
        }
      }
    }
    log("LIST VA CHam2 $collisionList");
    isShowSetting.value = false;
  }

  List getCollide(Offset x) {
    getTruePointCheck();
    if (Get.width <= photo.value.width) {
      return checkCollide(truePointCheckRatio, x);
    } else {
      return checkCollide(truePointCheck, x);
    }
  }

  List checkCollide(List listCheck, Offset x) {
    List z = [];
    listCheck.forEachIndexed((i, element) {
      if ((x.dy >= element[0].dy) &&
          (x.dx >= element[0].dx) &&
          (x.dx <= element[1].dx) &&
          (x.dy <= element[1].dy)) {
        z = truePointDraw[i];
      }
    });
    return z;
  }

  void getTruePointCheck() {
    offsetImage.value = getOffsetImage();
    if (truePointCheckRatio.isEmpty) {
      for (var element in truePointDraw) {
        truePointCheckRatio.add([
          Offset(element[0].dx + offsetImage.value.dx,
              element[0].dy + offsetImage.value.dy),
          Offset(element[1].dx + offsetImage.value.dx,
              element[1].dy + offsetImage.value.dy)
        ]);
      }
    }
    if (truePointCheck.isEmpty) {
      for (var element in truePointDraw) {
        truePointCheck.add([
          Offset((element[0].dx / ratioImage) + offsetImage.value.dx,
              (element[0].dy / ratioImage) + offsetImage.value.dy),
          Offset((element[1].dx / ratioImage) + offsetImage.value.dx,
              (element[1].dy / ratioImage) + offsetImage.value.dy)
        ]);
      }
    }
  }

  //------------------------------- Check Win and clear Draw

  Future<void> checkWin() async {
    switch (gameLoad.value.difficultyLevel) {
      case 0:
        log('abc0 ${collisionList.length} ${truePointDraw.length}');
        return await checkWinEasy();
      case 1:
        log('abc1 ${collisionList.length} ${truePointDraw.length}');
        return await checkWinMedium();
      case 2:
        break;
      default:
        break;
    }
  }

  Future<void> checkWinEasy() async {
    List maskReverse = truePointDraw.reversed.toList();
    if (const IterableEquality().equals(collisionList, truePointDraw) ||
        const IterableEquality().equals(collisionList, maskReverse)) {
      log('Win');
      showConfetti();
      isWin.value = true;
    }
  }

  Future<void> checkWinMedium() async {
    if (collisionList.length == truePointDraw.length) {
      log('Win');
      showConfetti();
      isWin.value = true;
    }
  }

  void clearDraw() {
    collisionList.clear();
    Timer(const Duration(milliseconds: 300), () {
      lines.clear();
      line.value = DrawnLine();
    });
  }

  //------------------------------- Next Level

  Future<void> nextLevel() async {
    isShowSetting.value = false;
    isVolume.value ? audioCacheButton.play(pathButton) : null;
    if (isWin.value && gameLoad.value.id != gameList[gameList.length - 1].id) {
      int index = gameList.indexOf(
          gameList.singleWhere((element) => element.id == gameLoad.value.id));
      gameLoad.value = gameList[index + 1];
      truePointCheckRatio.clear();
      truePointCheck.clear();
      await getRatioImage(gameLoad.value);
      await getTruePointDraw(gameLoad.value);
      await HiveModule.putValue('LoadLevel', gameLoad.value);
      AdHelper.initIntertitials(this);
      isWin.value = false;
      isNext.value = true;
      await Future.delayed(const Duration(milliseconds: 100));
      isNext.value = false;
    } else {
      isWin.value = false;
    }
  }

  // Future<void> clearWhenWin() async {
  //   isNext.value = false;
  //   int index = gameList.indexOf(
  //       gameList.singleWhere((element) => element.id == gameLoad.value.id));
  //   Game gameLoad2 = gameList[index + 1];
  //   truePointCheckRatio.clear();
  //   truePointCheck.clear();
  //   await getRatioImage(gameLoad2);
  //   await getTruePointDraw(gameLoad2);
  //   isNext.value = true;
  // }

  Future<void> showHint() async {
    offsetImage.value = getOffsetImage();
    isVolume.value ? audioCacheButton.play(pathButton) : null;
    AdHelper.showRewardedAd(this);
  }

  // -----------------------------  Image

  Offset getOffsetImage() {
    var box = keyImage.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero);
    log('POSSTION $position ${box.size.width} ${box.size.height} ${Get.width} ${Get.height}');
    return position;
  }

  Future<void> getRatioImage(Game gameLoad) async {
    Uint8List? data;
    try {
      final byteData = await rootBundle.load(gameLoad.imageFail);

      data = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    } catch (ex) {
      log('$ex}');
    }

    setImageBytes(data);
  }

  void setImageBytes(imageBytes) {
    List<int> values = imageBytes.buffer.asUint8List();

    photo.value = img.decodeImage(values);
    if (Get.width <= photo.value.width) {
      ratioImage = photo.value.width / (Get.width - 64);
    }
  }

  //------------------------------------ Audio
  late AudioPlayer audioPlayerBackground;
  String pathBackground = 'audio/background.mp3';
  late AudioCache audioCacheBackground;

  Future<void> audioBackground() async {
    audioPlayerBackground = AudioPlayer();
    audioPlayerBackground.state = PlayerState.COMPLETED;
    audioCacheBackground = AudioCache(fixedPlayer: audioPlayerBackground);
  }

  late AudioPlayer audioPlayerButton;
  String pathButton = 'audio/Eff_Button.mp3';
  late AudioCache audioCacheButton;

  void audioButton() {
    audioPlayerButton = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    audioPlayerButton.state = PlayerState.COMPLETED;
    audioCacheButton = AudioCache(fixedPlayer: audioPlayerButton);
  }

  late AudioPlayer audioPlayerLevelComplete;
  String pathLevelComplete = 'audio/Eff_Level_Complete.mp3';
  late AudioCache audioCacheLevelComplete;

  void audioLevelComplete() {
    audioPlayerLevelComplete = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    audioPlayerLevelComplete.state = PlayerState.COMPLETED;
    audioCacheLevelComplete = AudioCache(fixedPlayer: audioPlayerLevelComplete);
  }

//-------------------------------------------- Anime Confetti
  Future<void> showConfetti() async {
    isShowHint.value = false;
    isVolume.value ? audioCacheLevelComplete.play(pathLevelComplete) : null;
    showComplete();
    isShowConfetti.value = true;
    await Future.delayed(const Duration(milliseconds: 3300));
    isShowConfetti.value = false;
  }

  Future<void> showComplete() async {
    isShowComplete.value = true;
    await Future.delayed(const Duration(milliseconds: 2000));
    isShowComplete.value = false;
  }

  //------------------------------------------- Setting

  void showSetting() {
    isVolume.value ? audioCacheButton.play(pathButton) : null;
    isShowSetting.value = !isShowSetting.value;
  }

  Future<void> settingPhone() async {
    isPhone.value = !isPhone.value;
    isVolume.value ? audioCacheButton.play(pathButton) : null;
    await HiveModule.putValue(
      'phone',
      isPhone.value,
    );
  }

  Future<void> settingVolume() async {
    isVolume.value = !isVolume.value;
    isVolume.value ? audioCacheButton.play(pathButton) : null;
    await HiveModule.putValue(
      'volume',
      isVolume.value,
    );
  }

  Future<void> settingMusicBackground() async {
    isMusic.value = !isMusic.value;
    isMusic.value
        ? audioCacheBackground.loop(pathBackground)
        : audioPlayerBackground.stop();
    isVolume.value ? audioCacheButton.play(pathButton) : null;
    await HiveModule.putValue(
      'music',
      isMusic.value,
    );
  }

  //---------------------------------------- Khi Ẩn app

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state.name) {
      case "inactive":
        audioPlayerBackground.pause();
        break;
      case "resumed":
        audioPlayerBackground.resume();
        break;
    }
  }

  @override
  void onReady() {
    AdHelper.initBannerAd(this);
    AdHelper.showBannerAd();
    AdHelper.initRewardedAd(this);
    offsetImage.value = getOffsetImage();
    super.onReady();
  }

  @override
  void onLoadedBanner(Ad ad) {
    log('succcess');
    AdHelper.bannerAd = ad as BannerAd;
    isLoadAds.value = true;
  }

  @override
  void onUserEarnedReward(AdWithoutView ad, RewardItem reward) {
    isMusic.value ? audioCacheBackground.loop(pathBackground) : null;
    isShowHint.value = true;
  }

  @override
  void onAdLoaded(InterstitialAd ad) {
    log('showHint12312321');
  }

  @override
  Future<void> onAdDismissedFullScreenContent(InterstitialAd ad) async {
    var currentTime = DateTime.now().microsecondsSinceEpoch;
    await HiveModule.putValue("last_show_intertitials", currentTime);
  }
}
