import 'package:flutter/material.dart';

import 'package:shop_all_fe/common/resource/enum_resource.dart';

import 'base_error_dialog.dart';
import 'base_indicator.dart';

class BaseView extends StatelessWidget {
  final Status? status;
  final Widget? onSuccess;
  final Widget? onFail;
  final Widget? onLoading;
  final String? content;

  const BaseView({Key? key, this.status, this.onSuccess, this.onFail, this.onLoading, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == Status.error) {
      return onFail ?? BaseErrorDialog(content: content, showConfirm: false);
    } else if (status == Status.noConnection) {
      return onFail ?? BaseErrorDialog(content: content, textButtonConfirm: 'Thử lại');
    } else if (status == Status.loading) {
      return onLoading ?? const BaseIndicator();
    } else if (status == Status.waiting) {
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
    return onSuccess ?? Container();
  }
}
