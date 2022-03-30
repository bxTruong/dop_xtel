import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final TextStyle? style;

  const CustomText({Key? key, this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text ?? '',
      style: style,
      toolbarOptions: const ToolbarOptions(copy: true, cut: false, paste: false, selectAll: true),
    );
  }
}
