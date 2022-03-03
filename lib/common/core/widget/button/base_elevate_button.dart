import 'package:flutter/material.dart';

class BaseElevatedButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Function()? onTab;
  final Color? titleColor;
  final TextStyle? style;
  final double? titleSize;
  final FontWeight? titleFontWeight;
  final double? borderRadiusValue;
  final ButtonStyle? buttonStyleValue;
  final Color? primaryColorValue;
  final double? widthValue;
  final double? heightValue;

  const BaseElevatedButton({
    Key? key,
    this.title,
    this.child,
    this.onTab,
    this.titleColor,
    this.style,
    this.titleSize,
    this.titleFontWeight,
    this.borderRadiusValue,
    this.buttonStyleValue,
    this.primaryColorValue,
    this.widthValue,
    this.heightValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthValue,
      height: heightValue,
      child: ElevatedButton(
        onPressed: onTab,
        child: child ??
            Text(
              title ?? '',
              style: style ??
                  TextStyle(
                    color: titleColor,
                    fontSize: titleSize,
                    fontWeight: titleFontWeight,
                  ),
            ),
        style: buttonStyleValue ??
            ElevatedButton.styleFrom(
              primary: primaryColorValue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
              ),
            ),
      ),
    );
  }
}




