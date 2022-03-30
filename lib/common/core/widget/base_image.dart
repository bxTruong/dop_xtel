import 'dart:io';
import 'package:dop_xtel/common/export_this.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class BaseImage {
  static Widget storage({
    required String path,
    BoxFit? boxFit,
    double? width,
    double? height,
    double? borderRadiusValue,
    EdgeInsetsGeometry? paddingValue,
  }) {
    return Container(
      width: width,
      height: height,
      padding: paddingValue,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        color: Colors.red,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        child: Image.file(
          File(path),
          fit: boxFit ?? BoxFit.cover,
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
    EdgeInsetsGeometry? paddingValue,
    Color? color,
  }) {
    return Container(
      width: width,
      height: height,
      padding: paddingValue,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        color: Colors.red,
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
    EdgeInsetsGeometry? paddingValue,
  }) {
    return Container(
      width: width,
      height: height,
      padding: paddingValue,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        color: Colors.red,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        child: SvgPicture.asset(
          path,
          fit: boxFit ?? BoxFit.cover,
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
    EdgeInsetsGeometry? paddingValue,
  }) {
    return Container(
      width: width,
      height: height,
      padding: paddingValue,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        color: Colors.red,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
        child: Image.network(
          path,
          fit: boxFit ?? BoxFit.cover,
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
