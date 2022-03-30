import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdOpenAdsListener {
  void onAdLoaded(AppOpenAd ad) {}

  void onAdFailedToLoad(LoadAdError error) {}

  ///Được gọi khi quảng cáo loại bỏ nội dung toàn màn hình.
  void onAdDismissedFullScreenContent(AppOpenAd ad) {}

  ///Được gọi khi một quảng cáo hiển thị nội dung toàn màn hình.
  void onAdShowedFullScreenContent(AppOpenAd ad) {}

  ///Được gọi khi quảng cáo không hiển thị nội dung toàn màn hình
  void onAdFailedToShowFullScreenContent(AppOpenAd ad, AdError error) {}

  ///Được gọi khi một lần hiển thị quảng cáo xảy ra.
  void onAdImpression(AppOpenAd ad) {}

  ///Được gọi khi quảng cáo được nhấp vào.
  void onAdClicked(AppOpenAd ad) {}

  ///Chỉ dành cho iOS. Được gọi trước khi loại bỏ chế độ xem toàn màn hình.
  void onAdWillDismissFullScreenContent(AppOpenAd ad) {}
}
