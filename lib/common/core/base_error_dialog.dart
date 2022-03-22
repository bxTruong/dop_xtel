import 'package:flutter/material.dart';

import 'package:app_shopee_lite/common/core/language/key_language.dart';
import 'package:get/get.dart';

class BaseErrorDialog extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  final Function? mConfirm;
  final Function? mCancel;

  const BaseErrorDialog({Key? key, this.title, this.style, this.mConfirm, this.mCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
                constraints: const BoxConstraints(minHeight: 200),
                padding: const EdgeInsets.all(8.0),
                child: Text(title ?? '', style: style)),
            Row(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }

  void onCancel() {
    Get.back();
  }

  void onConfirm() {
    Get.back();
  }
}
