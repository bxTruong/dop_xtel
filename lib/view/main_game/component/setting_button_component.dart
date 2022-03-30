import 'package:dop_xtel/common/resource/image_resource.dart';
import 'package:dop_xtel/view/main_game/main_game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sizer/sizer.dart';
import '../../../common/export_this.dart';

class SettingButtonComponent extends GetWidget<MainGameController> {
  const SettingButtonComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => animationItemSetting(
            //color: Colors.brown,
            marginLeft: 13,
            heightContainer: 230,
            widthIcon: 30,
            heightIcon: 30,
            animatedWidget: (child, anim) => PositionedTransition(
              rect: RelativeRectTween(
                begin: const RelativeRect.fromLTRB(0, -100, 0, 0),
                end: const RelativeRect.fromLTRB(0, 160, 0, 0),
              ).animate(anim),
              child: FadeTransition(opacity: anim, child: child),
            ),
            function: () => controller.settingMusicBackground(),
            path: controller.isMusic.value
                ? ImageResource.ic_music_note
                : ImageResource.ic_music_note_none,
          ),
        ),
        Obx(
          () => animationItemSetting(
            //color: Colors.lightBlue,
            marginLeft: 18,
            heightContainer: 170,
            widthIcon: 36,
            heightIcon: 36,
            animatedWidget: (child, anim) => PositionedTransition(
              rect: RelativeRectTween(
                begin: const RelativeRect.fromLTRB(0, -80, 0, 0),
                end: const RelativeRect.fromLTRB(0, 120, 0, 0),
              ).animate(anim),
              child: FadeTransition(opacity: anim, child: child),
            ),
            function: () => controller.settingVolume(),
            path: controller.isVolume.value
                ? ImageResource.ic_volume
                : ImageResource.ic_volume_mute,
          ),
        ),
        Obx(
          () => animationItemSetting(
            marginLeft: 16,
            // color: Colors.orange,
            heightContainer: 120,
            widthIcon: 46,
            heightIcon: 46,
            animatedWidget: (child, anim) => PositionedTransition(
              rect: RelativeRectTween(
                begin: const RelativeRect.fromLTRB(0, -50, 0, 0),
                end: const RelativeRect.fromLTRB(0, 50, 0, 0),
              ).animate(anim),
              child: FadeTransition(opacity: anim, child: child),
            ),
            function: () => controller.settingPhone(),
            path: controller.isPhone.value
                ? ImageResource.ic_smartphone
                : ImageResource.ic_smartphone_none,
          ),
        ),
//Icon setting
        Obx(() => Positioned(
              top: 40,
              left: 16,
              child: SizedBox(
                width: 64,
                height: 64,
                child: InkWell(
                  onTap: () => controller.showSetting(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, anim) => RotationTransition(
                      turns: child.key == const ValueKey('icon3')
                          ? Tween<double>(begin: 1, end: 0.6).animate(anim)
                          : Tween<double>(begin: 0.6, end: 1).animate(anim),
                      child: FadeTransition(opacity: anim, child: child),
                    ),
                    child: controller.isShowSetting.value
                        ? BaseImage.svg(
                            path: ImageResource.ic_setting,
                            width: 40,
                            height: 40,
                            key: const ValueKey('icon3'))
                        : BaseImage.svg(
                            path: ImageResource.ic_setting,
                            width: 40,
                            height: 40,
                            key: const ValueKey('icon4'),
                          ),
                  ),
                ),
              ),
            ))
      ],
    );
  }

  Widget itemSetting({required Widget icon, required Function function, key}) {
    return IconButton(
      key: key,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () => function.call(),
      icon: icon,
    );
  }

  Widget animationItemSetting({
    double? marginLeft,
    double? marginTop,
    double? widthContainer,
    required double? heightContainer,
    required AnimatedSwitcherTransitionBuilder animatedWidget,
    int? reverseDuration,
    int? duration = 300,
    required double? widthIcon,
    required double? heightIcon,
    required Function function,
    required String path,
    bool? boolCheck,
    Color? color,
  }) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft ?? 10, top: marginTop ?? 42),
      width: widthContainer ?? 64,
      height: heightContainer,
      color: color,
      child: AnimatedSwitcher(
        reverseDuration: Duration(milliseconds: reverseDuration ?? 200),
        duration: Duration(milliseconds: duration ?? 300),
        transitionBuilder: animatedWidget,
        child: boolCheck ?? controller.isShowSetting.value
            ? itemSetting(
                icon: BaseImage.svg(
                  path: path,
                  width: widthIcon,
                  height: heightIcon,
                ),
                function: () => function.call(),
              )
            : Container(),
      ),
    );
  }
}
