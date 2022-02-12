import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String? title;
  final Widget? child;
  final Function? onTab;
  final Color? backgroundColor;
  final Color? titleColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? style;

  const BaseButton({
    Key? key,
    this.title,
    this.child,
    this.onTab,
    this.backgroundColor,
    this.titleColor,
    this.padding,
    this.borderRadius,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: () => onTab?.call(),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0),
          child: child ??
              Text(title ?? '', style: style ?? TextStyle(color: titleColor)),
        ),
      ),
    );
  }
}
