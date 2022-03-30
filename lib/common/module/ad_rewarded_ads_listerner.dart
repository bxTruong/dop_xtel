import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdRewardedAdsListener {
  void onLoadedRewarded(RewardedAd ad) {}

  void onFailRewarded(LoadAdError error) {}

  ///Được gọi khi quảng cáo loại bỏ nội dung toàn màn hình.
  void onDismissedFullScreenRewarded(RewardedAd ad) {}

  ///Được gọi khi một quảng cáo hiển thị nội dung toàn màn hình.
  void onShowedFullScreenRewarded(RewardedAd ad) {}

  ///Được gọi khi quảng cáo không hiển thị nội dung toàn màn hình
  void onFailedToShowFullScreenRewarded(RewardedAd ad, AdError error) {}

  ///Được gọi khi một lần hiển thị quảng cáo xảy ra.
  void onImpressionRewarded(RewardedAd ad) {}

  ///Được gọi khi quảng cáo được nhấp vào.
  void onClickedRewarded(RewardedAd ad) {}

  ///Chỉ dành cho iOS. Được gọi trước khi loại bỏ chế độ xem toàn màn hình.
  void onWillDismissFullScreenRewarded() {}

  ///function nhận thưởng
  void onUserEarnedReward(AdWithoutView ad, RewardItem reward) {}
}
