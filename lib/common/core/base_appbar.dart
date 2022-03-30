import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BaseAppBar extends PreferredSize {
  String? title;
  TextStyle? style;
  List<Widget>? action;
  Color? backgroundColor;
  Color? colorIcon;
  double? elevation = 0;
  bool? isLight;
  bool? isLeading = true;
  Widget? flexibleSpace;
  Icon? iconLeading;
  Function? functionLeading;
  final SystemUiOverlayStyle? systemOverlayStyle;

  BaseAppBar({
    this.systemOverlayStyle,
    this.title,
    this.style,
    this.action,
    this.backgroundColor,
    this.colorIcon,
    this.elevation,
    this.isLight,
    this.isLeading,
    this.flexibleSpace,
    this.iconLeading,
    this.functionLeading,
  }) : super(preferredSize: const Size(double.infinity, kToolbarHeight), child: Container());

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
      systemOverlayStyle: systemOverlayStyle ?? SystemUiOverlayStyle.light,
      title: Text(
        title ?? '',
        style: style,
        overflow: TextOverflow.ellipsis,
      ),
      flexibleSpace: flexibleSpace ?? Container(),
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      leading: iconLeading ??
          IconButton(
              splashRadius: 26,
              onPressed: () => functionLeading?.call() ?? Get.back(),
              icon: const Icon(Icons.arrow_back_rounded, size: 26, color: Colors.white)),
      iconTheme: IconThemeData(color: colorIcon),
      actions: action);
}
