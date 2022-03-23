import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_all_fe/common/export_this.dart';

class BaseImage {
  static Widget storage({
    required String path,
    BoxFit? boxFit,
    double? width,
    double? height,
    double? borderRadiusValue,
    EdgeInsetsGeometry? padding,
    Color? color,
  }) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        child: Image.file(
          File(path),
          fit: boxFit ?? BoxFit.contain,
        ),
      ),
    );
  }

  static Widget asserts({
    required String path,
    BoxFit? boxFit,
    double? width,
    double? height,
    double? borderRadiusValue,
    EdgeInsetsGeometry? padding,
    Color? color,
  }) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        child: Image.asset(
          path,
          fit: boxFit,
          color: color,
        ),
      ),
    );
  }

  static Widget svg({
    required String path,
    BoxFit? boxFit,
    double? width,
    double? height,
    double? borderRadiusValue,
    Color? color,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        color: color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        child: SvgPicture.asset(
          path,
          fit: boxFit ?? BoxFit.contain,
          color: color,
        ),
      ),
    );
  }

  static Widget network({
    required String path,
    BoxFit? boxFit,
    double? width,
    double? height,
    double? borderRadiusValue,
    Color? color,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        color: Colors.red,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        child: Image.network(
          path,
          fit: boxFit ?? BoxFit.contain,
          errorBuilder: (context, exception, stackTrace) =>
              const Icon(Icons.collections_rounded, color: Colors.grey),
          loadingBuilder: (BuildContext ctx, Widget? child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child ?? Container();
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          ColorResource.primary)));
            }
          },
        ),
      ),
    );
  }
}
