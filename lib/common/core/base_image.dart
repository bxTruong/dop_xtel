import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_all_fe/common/export_this.dart';

class BaseImage {
  static Widget storage(
      {String? path, BoxFit? boxFit, double? width, double? height, BorderRadius? borderRadius}) {
    return Image.file(
      File(path ?? ''),
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.cover,
    );
  }

  static Widget asserts(
      {String? path,
      BoxFit? boxFit,
      double? width,
      double? height,
      BorderRadius? borderRadius,
      Color? color}) {
    return Image.asset(
      path ?? '',
      width: width,
      height: height,
      fit: boxFit,
      color: color,
    );
  }

  static Widget svg(
      {String? path,
      BoxFit? boxFit,
      double? width,
      double? height,
      BorderRadius? borderRadius,
      Color? color}) {
    return SvgPicture.asset(
      path ?? '',
      fit: boxFit ?? BoxFit.cover,
      color: color,
    );
  }

  static Widget network(
      {String? path,
      BoxFit? boxFit,
      double? width,
      double? height,
      BorderRadius? borderRadius,
      Color? color}) {
    return Image.network(
      path ?? '',
      width: width,
      height: height,
      fit: boxFit ?? BoxFit.cover,
      errorBuilder: (context, exception, stackTrace) =>
          const Icon(Icons.collections_rounded, color: Colors.grey),
      loadingBuilder: (BuildContext ctx, Widget? child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child ?? Container();
        } else {
          return const Center(
              child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(ColorResource.primary)));
        }
      },
    );
  }
}
