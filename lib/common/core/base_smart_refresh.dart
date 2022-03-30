import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_all_fe/common/core/base_refresh_controller.dart';
import 'package:shop_all_fe/common/core/language/key_language.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'package:shop_all_fe/common/resource/style_resourse.dart';
import 'package:shop_all_fe/common/utils.dart';

class BaseSmartRefresh extends StatelessWidget {
  final BaseRefreshController? controller;
  final Widget? child;
  final Widget? header;
  final Widget? footer;
  final bool? enablePullDown;
  final bool? enablePullUp;
  final Function? onLoading;
  final Function? onRefresh;
  final Function(BuildContext context, int index)? itemBuilder;
  final ScrollPhysics? physics;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        itemCount == 0
            ? Center(
                child: Text(
                  KeyLanguage.empty.tr,
                  style: StyleResource.s15r,
                ),
              )
            : const SizedBox(width: 0, height: 0),
        SmartRefresher(
          controller: controller?.controller ?? RefreshController(),
          child: child ??
              ListView.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, index) => itemBuilder?.call(context, index)),
          enablePullDown: enablePullDown ?? true,
          enablePullUp: enablePullUp ?? true,
          // header: header ??
          //     const ClassicHeader(
          //         releaseText: '', refreshingText: '', failedText: '', idleText: ''),
          footer: footer ??
              ClassicFooter(
                loadingText: 'Đang tải',
                canLoadingText: '',
                idleText: '',
                idleIcon: SizedBox(width: 0, height: 0),
                loadingIcon: SizedBox(
                  width: 25.0,
                  height: 25.0,
                  child: Platform.isIOS
                      ? const CupertinoActivityIndicator()
                      : const CircularProgressIndicator(
                          strokeWidth: 2.0,
                          color: ColorResource.primary,
                        ),
                ),
              ),
          onLoading: () async => await controller?.loadMoreData() ?? onLoading?.call(),
          onRefresh: () async => await controller?.refreshData() ?? onRefresh?.call(),
          physics: physics,
        ),
      ],
    );
  }

  BaseSmartRefresh(
      {this.controller,
      this.child,
      this.itemBuilder,
      this.header,
      this.footer,
      this.enablePullDown,
      this.enablePullUp,
      this.onLoading,
      this.onRefresh,
      this.physics,
      this.itemCount,
      Key? key})
      : super(key: key);
}
