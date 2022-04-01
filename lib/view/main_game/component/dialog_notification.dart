import 'package:dop_xtel/common/core/widget/base_image.dart';
import 'package:dop_xtel/common/core/widget/button/base_outlined_button.dart';
import 'package:dop_xtel/common/export_this.dart';
import 'package:dop_xtel/common/resource/image_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outlined_text/outlined_text.dart';

class DialogNotification extends StatelessWidget {
  const DialogNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: ColorResource.black_border,
          width: 1.6,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.only(
        right: 72,
        left: 72,
        bottom: 32,
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedText(
              text: const Text(
                'No Internet Connection',
                style: TextStyle(
                  color: ColorResource.yellow_text,
                  fontSize: 28,
                  fontFamily: 'FredokaOne',
                  letterSpacing: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              strokes: [
                OutlinedTextStroke(color: ColorResource.black_text, width: 3),
              ],
            ),
            const SizedBox(
              width: 0,
              height: 32,
            ),
            const Text(
              "Some actions aren't available OFFLINE. Please check your internet connection",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: ColorResource.black_text_notification,
                  fontSize: 20,
                  fontFamily: 'LiberationSans',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 0,
              height: 16,
            ),
            BaseImage.svg(
              path: ImageResource.ic_internet_warning,
              width: 48,
              height: 48,
            ),
            const SizedBox(
              width: 0,
              height: 32,
            ),
            BaseOutlinedButton(
              sizeBorder: 1.6,
              onTab: Get.back,
              borderRadiusValue: 20,
              titleColor: ColorResource.black_text,
              colorBorderValue: ColorResource.black_text,
              heightValue: 60,
              widthValue: 90,
              titleSize: 18,
              child: OutlinedText(
                text: const Text(
                  'Ok',
                  style: TextStyle(
                    color: ColorResource.yellow_text,
                    fontSize: 20,
                    fontFamily: 'FredokaOne',
                    letterSpacing: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                strokes: [
                  OutlinedTextStroke(color: ColorResource.black_text, width: 3),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
