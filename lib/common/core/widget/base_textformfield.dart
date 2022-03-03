import 'package:flutter/material.dart';

abstract class BaseTextFormField extends StatelessWidget {
  final TextEditingController editingController;
  final Function(String value)? onChange;
  final bool? readOnly;
  final bool? enable;
  final TextInputType? textInputType;
  final int? maxLines;
  final Icon? headIcon;
  final Function(String error)? error;

  const BaseTextFormField({
    required this.editingController,
    this.onChange,
    this.maxLines,
    this.readOnly,
    this.error,
    this.headIcon,
    this.enable,
    this.textInputType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editingController,
      readOnly: readOnly ?? false,
      enabled: enable ?? true,
      keyboardType: textInputType ?? TextInputType.text,
      onChanged: (value) {
        onChange?.call(value);
      },
    );
  }
}
