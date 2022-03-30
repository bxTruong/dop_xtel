import 'package:flutter/material.dart';
import 'package:shop_all_fe/common/core/base_button.dart';
import 'package:shop_all_fe/common/core/language/key_language.dart';
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
                Expanded(
                  child: BaseButton(
                      onTab: () => mConfirm?.call() ?? onConfirm(),
                      title: KeyLanguage.ok.tr,
                      titleColor: Colors.red),
                ),
                Expanded(
                  child: BaseButton(
                      onTab: () => mCancel?.call() ?? onCancel(),
                      title: KeyLanguage.cancel.tr,
                      titleColor: Colors.grey),
                )
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
