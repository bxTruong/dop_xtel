import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class BaseInkWell extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Function()? onTab;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? titleSize;
  final FontWeight? titleFontWeight;

  // Thay thế kiểu padding
  final EdgeInsetsGeometry? padding;

  // Thay thế giá trị padding All
  final double? paddingValue;

  // BorderRadius.circular(10)
  final double? borderRadiusValue;
  final TextStyle? style;

  //DottedDecoration(
  // shape: Shape.box,
  // dash: <int>[1, 4],
  // borderRadius: BorderRadius.circular(10),
  // );
  final DottedDecoration? dottedDecoration;
  final Border? border;

  const BaseInkWell({
    Key? key,
    this.title,
    this.child,
    this.onTab,
    this.backgroundColor,
    this.titleColor,
    this.padding,
    this.borderRadiusValue,
    this.style,
    this.paddingValue,
    this.dottedDecoration,
    this.border,
    this.titleFontWeight,
    this.titleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: border,
      borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
      child: Container(
        decoration: dottedDecoration,
        child: InkWell(
          onTap: onTab,
          borderRadius: BorderRadius.circular(borderRadiusValue ?? 0),
          child: Container(
            padding: padding ?? EdgeInsets.all(paddingValue ?? 8),
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
          ),
        ),
      ),
    );
  }
}
