import 'package:flutter/material.dart';
import 'package:dop_xtel/common/core/base_error_dialog.dart';
import 'package:dop_xtel/common/core/base_indicator.dart';
import 'package:dop_xtel/common/resource/enum_resource.dart';
import 'package:get/get.dart';

class BaseView extends StatelessWidget {
  final Status? status;
  final Widget? onSuccess;
  final Widget? onFail;
  final Widget? onLoading;
  final String? title;

  const BaseView({Key? key, this.status, this.onSuccess, this.onFail, this.onLoading, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (status == Status.error) {
      return Container();
    } else if (status == Status.loading) {
      return onLoading ?? const BaseIndicator();
    }
    return onSuccess ?? Container();
  }
}
