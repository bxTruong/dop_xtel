import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBannerListener {
  void onLoadedBanner(Ad ad) {}

  void onFailedLoadBanner(Ad ad, LoadAdError error) {}

  void onOpenedBanner(Ad ad) {}

  void onClosedBanner(Ad ad) {}

  ///Được gọi khi một lần hiển thị quảng cáo xảy ra.
  void onImpressionBanner(Ad ad) {}

  ///Được gọi khi quảng cáo được nhấp vào.
  void onClickedBanner(Ad ad) {}

  ///Chỉ dành cho iOS. Được gọi trước khi loại bỏ chế độ xem toàn màn hình.
  void onWillDismissBanner(Ad ad) {}
}
