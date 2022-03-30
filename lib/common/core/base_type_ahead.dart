// Do Manh Tai - 04-08-2021/08/2021

import 'package:dop_xtel/common/core/theme_manager.dart';
import 'package:dop_xtel/common/export_this.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import 'language/key_language.dart';

class BaseTypeAhead extends StatefulWidget {
  final Widget? widgetLeft, widgetRight, widgetAfterLeft;
  final TextInputType? inputType;
  final TextEditingController? editingController;
  final String? hint, error, label;
  final Function? onTap;
  final Function? onChange;
  final Function? onComplete;
  final Function? onSubmitted;
  final Function? itemBuilder;
  final Function? suggestionsBoxDecoration;
  final bool? isReadOnly;
  final int? minLine, maxLines;
  final double? padH, padV, borderRadius;
  final TextCapitalization? capitalization;
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget? widgetAbove, widgetBelow;
  final Function? suggestCallBack;
  final Function? onSuggestionSelected;
  final Function? onValidator;
  final double? border;
  final OutlineInputBorder? enableBorder,
      focusBorder,
      disableBorder,
      errorBorder,
      focusedErrorBorder;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final String? initialValue;
  final BoxConstraints? suffixConstraint, prefixConstraint;

  const BaseTypeAhead(
      {this.widgetLeft,
      this.widgetRight,
      this.widgetAfterLeft,
      this.widgetBelow,
      this.widgetAbove,
      this.label,
      this.inputType,
      this.editingController,
      this.hint,
      this.onChange,
      this.onComplete,
      this.onTap,
      this.isReadOnly,
      this.minLine,
      this.maxLines,
      this.padH,
      this.focusNode,
      this.padV,
      this.itemBuilder,
      this.prefixConstraint,
      this.capitalization,
      this.backgroundColor,
      this.borderColor,
      this.suffixConstraint,
      this.suggestCallBack,
      this.onSuggestionSelected,
      this.suggestionsBoxDecoration,
      this.onSubmitted,
      this.initialValue,
      this.error,
      this.border = 0, this.borderRadius, this.onValidator, this.enableBorder, this.focusBorder, this.disableBorder, this.errorBorder, this.focusedErrorBorder, this.contentPadding});

  @override
  State<BaseTypeAhead> createState() => _BaseTypeAheadState();
}

class _BaseTypeAheadState extends State<BaseTypeAhead> {
  final _textFormFieldKey = GlobalKey<FormState>();
  Color? _labelColor;
  final Color _highColor = ColorResource.textBody;
  final Color _lowColor = ColorResource.textBody.withOpacity(0.5);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() => _labelColor = hasFocus ? _highColor : _lowColor);
        },
        child: Form(
          key: _textFormFieldKey,
          child: TypeAheadFormField(
            hideSuggestionsOnKeyboardHide: false,
            enabled: widget.isReadOnly ?? true,
            textFieldConfiguration: TextFieldConfiguration(
              focusNode: widget.focusNode ?? FocusNode(),
              controller: widget.editingController,
              onChanged: (String value) {
                widget.onChange?.call(value);
                if (_textFormFieldKey.currentState != null) {
                  if (_textFormFieldKey.currentState!.validate()) {
                    _textFormFieldKey.currentState!.save();
                  }
                }
              },
              onSubmitted: (t) {
                widget.onSubmitted?.call(t);
                FocusScope.of(context).nextFocus();
              },
              textCapitalization:
                  widget.capitalization ?? TextCapitalization.sentences,
              enabled: widget.isReadOnly ?? true,
              keyboardType: widget.inputType ?? TextInputType.text,
              style: appTheme.textTheme.bodyText1,
              decoration: InputDecoration(
                errorText: widget.error,
                contentPadding: EdgeInsets.symmetric(
                    vertical: widget.padV ?? 16, horizontal: widget.padH ?? 0),
                isDense: true,
                labelText: widget.label ?? widget.hint,
                labelStyle:
                    appTheme.textTheme.bodyText2?.apply(color: _labelColor),
                hintText: widget.hint,
                hintStyle: appTheme.textTheme.bodyText2
                    ?.apply(color: ColorResource.textBody.withOpacity(0.5)),
                filled: true,
                fillColor: Colors.white,
                prefixIconConstraints: widget.prefixConstraint ??
                    const BoxConstraints(maxWidth: 45, maxHeight: 50),
                prefixIcon: widget.widgetLeft,
                suffixIcon: widget.widgetRight,
                suffixIconConstraints: widget.suffixConstraint ??
                    const BoxConstraints(maxWidth: 45),
              ),
            ),
            validator: (value) => widget.onValidator?.call(value) ?? null,
            suggestionsCallback: (pattern) async {
              // if (pattern != '')
              return await widget.suggestCallBack!.call(pattern);
              // return [];
            },
            itemBuilder: (context, dynamic suggestion) {
              return widget.itemBuilder?.call(suggestion) ??
                  ListTile(
                    title: Text(
                      suggestion.title ?? 'Default',
                      style: appTheme.textTheme.bodyText1,
                    ),
                  );
            },
            hideOnError: true,
            transitionBuilder: (context, suggestionsBox, controller) {
              return suggestionsBox;
            },
            noItemsFoundBuilder: (BuildContext context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                child: Text(
                  KeyLanguage.empty.tr,
                  style: appTheme.textTheme.bodyText1,
                ),
              );
            },
            hideOnLoading: false,
            hideOnEmpty: true,
            onSuggestionSelected: (dynamic suggestion) {
              widget.editingController?.text = suggestion.title ?? 'Default';
              widget.onSuggestionSelected!.call(suggestion);
            },
          ),
        ),
      ),
    );
  }
}
