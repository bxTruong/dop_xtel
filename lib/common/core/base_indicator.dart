import 'dart:io';

import 'package:app_shopee_lite/common/resource/color_resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BaseIndicator extends StatelessWidget {
  const BaseIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? LinearProgressIndicator(
            minHeight: 4,
            color: ColorResource.primary,
            backgroundColor: ColorResource.primary.withOpacity(0.5))
        : Center(
            child: Platform.isIOS
                ? const CircularProgressIndicator(color: ColorResource.primary)
                : const CupertinoActivityIndicator());
  }
}
