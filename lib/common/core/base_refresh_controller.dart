import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_all_fe/common/core/base_function.dart';

class BaseRefreshController {
  RefreshController? controller;
  Function? callData;
  int? pageIndex;
  bool? isRefreshing;
  bool? endPoint;

  BaseRefreshController(
      {this.controller, this.callData, this.pageIndex, this.isRefreshing, this.endPoint});

  Future refreshData() async {
    showLog('Refresh data');
    isRefreshing = true;
    pageIndex = 1;
    endPoint = false;
    await callData?.call();
    refreshed();
  }

  void refreshed() {
    if (controller != null) {
      controller?.resetNoData();
      controller?.refreshCompleted();
    }
  }

  Future loadMoreData() async {
    showLog('Load more data');
    if (endPoint == false) {
      isRefreshing = false;
      pageIndex = (pageIndex ?? 1) + 1;
      await callData?.call();
      controller?.loadComplete();
    } else {
      controller?.loadNoData();
    }
  }

  bool getRefreshing() => isRefreshing ?? false;

  void setEndPoint(bool b) => endPoint = b;

  void setPageIndex(int i) => pageIndex = i;

  void setFunction(Function f) => callData = f;

  void setController(RefreshController rc) => controller = rc;
}
