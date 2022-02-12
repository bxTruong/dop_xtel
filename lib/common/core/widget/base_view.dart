import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/export_this.dart';

abstract class BaseView<T extends BaseController> extends GetWidget<T> {
  final Status? status;
  final Widget? onSuccess;
  final Widget? onFail;
  final Widget? onLoading;
  final Widget? onWaiting;
  final String? content;

  const BaseView(
      {Key? key,
      this.status,
      this.onSuccess,
      this.onFail,
      this.onLoading,
      this.content,
      this.onWaiting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => body()),
      backgroundColor: Colors.white,
    );
  }

  Widget buildSuccess();

  Widget buildError() => BaseErrorDialog(content: content, showConfirm: false);

  Widget buildLoading() => const BaseIndicator();

  Widget buildWaiting() => Stack(
        children: [
          onSuccess ?? Container(),
          Container(
            color: Colors.black26.withOpacity(0.05),
            child: onLoading ?? const BaseIndicator(),
          ),
        ],
      );

  Status _getStatus() {
    return status ?? Get.find<T>().status.value;
  }

  Widget body() {
    switch (_getStatus()) {
      case Status.error:
        return _buildError();
      case Status.noConnection:
        return onFail ?? BaseErrorDialog(content: content, textButtonConfirm: 'Thử lại');
      case Status.loading:
        return _buildLoading();
      case Status.waiting:
        return _buildWaiting();
      default:
        return _buildSuccess();
    }
  }

  Widget _buildSuccess() {
    if (onSuccess != null) return onSuccess ?? Container();
    return buildSuccess();
  }

  Widget _buildError() {
    if (onFail != null) {
      return onFail ?? BaseErrorDialog(content: content, showConfirm: false);
    }
    return buildError();
  }

  Widget _buildLoading() {
    if (onLoading != null) {
      return onLoading ?? const BaseIndicator();
    }
    return buildLoading();
  }

  Widget _buildWaiting() {
    if (onWaiting != null) {
      return Stack(
        children: [
          onSuccess ?? Container(),
          Container(
            color: Colors.black26.withOpacity(0.05),
            child: onLoading ?? const BaseIndicator(),
          ),
        ],
      );
    }
    return buildWaiting();
  }
}
