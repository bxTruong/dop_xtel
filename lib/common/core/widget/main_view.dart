import 'package:flutter/material.dart';
import 'package:shop_all_fe/common/core/widget/base_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_all_fe/common/export_this.dart';

class MainView extends StatelessWidget {
  String? title;
  Function? onLeading;
  Function? onDrawerChanged;
  Function? onEndDrawerChanged;
  Widget? body;
  Widget? drawer;
  Widget? endDrawer;
  Widget? bottomNavigationBar;
  Widget? floatingActionButton;
  bool? endDrawerEnableOpenDragGesture;
  bool? drawerEnableOpenDragGesture;
  bool? resizeToAvoidBottomInset;
  Color? backgroundColor;

  Future<bool> onWillPop() async {
    onLeading?.call();
    Utils.hideKeyboard();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    PreferredSize? appBar;
    Widget? nav;
    Widget? draw;
    Widget? endDraw;
    if (!kIsWeb) {
      appBar =
          BaseAppBar(title: title, onLeading: onLeading != null ? () => onLeading?.call() : null);
      nav = bottomNavigationBar;
      draw = drawer;
      endDraw = endDrawer;
    }
    return WillPopScope(
        child: Scaffold(
            appBar: appBar,
            body: SafeArea(child: body ?? const SizedBox()),
            bottomNavigationBar: nav,
            drawer: draw,
            endDrawer: endDraw,
            floatingActionButton: floatingActionButton,
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            backgroundColor: backgroundColor,
            onDrawerChanged: (b) => onDrawerChanged?.call(b),
            onEndDrawerChanged: (b) => onEndDrawerChanged?.call(b),
            drawerEnableOpenDragGesture: kIsWeb ? false : drawerEnableOpenDragGesture ?? true,
            endDrawerEnableOpenDragGesture: kIsWeb ? false : endDrawerEnableOpenDragGesture ?? true,
            extendBody: true),
        onWillPop: () async => await onWillPop());
  }

  MainView(
      {Key? key,
      this.title,
      this.onLeading,
      this.onDrawerChanged,
      this.onEndDrawerChanged,
      this.body,
      this.drawer,
      this.endDrawer,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.endDrawerEnableOpenDragGesture,
      this.drawerEnableOpenDragGesture,
      this.resizeToAvoidBottomInset,
      this.backgroundColor})
      : super(key: key);
}
