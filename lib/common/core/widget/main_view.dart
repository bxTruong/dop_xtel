import 'package:flutter/material.dart';
import 'package:shop_all_fe/common/core/widget/base_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:shop_all_fe/common/export_this.dart';

@immutable
class MainView extends StatelessWidget {
  final String? title;
  final Function? onLeading;
  final Function? onDrawerChanged;
  final Function? onEndDrawerChanged;
  final Widget? body;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool? endDrawerEnableOpenDragGesture;
  final bool? drawerEnableOpenDragGesture;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
final Widget? noAppBar;
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
      this.backgroundColor,
      this.noAppBar})
      : super(key: key);

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
      appBar = BaseAppBar(
          title: title,
          onLeading: onLeading != null ? () => onLeading?.call() : null);
      nav = bottomNavigationBar;
      draw = drawer;
      endDraw = endDrawer;
    }
    return WillPopScope(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            Utils.hideKeyboard();
          },
          child: Scaffold(
              appBar: noAppBar==null ? appBar : null,
              body: SafeArea(child: body ?? const SizedBox()),
              bottomNavigationBar: nav,
              drawer: draw,
              endDrawer: endDraw,
              floatingActionButton: floatingActionButton,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              backgroundColor: backgroundColor,
              onDrawerChanged: (b) => onDrawerChanged?.call(b),
              onEndDrawerChanged: (b) => onEndDrawerChanged?.call(b),
              drawerEnableOpenDragGesture:
                  kIsWeb ? false : drawerEnableOpenDragGesture ?? true,
              endDrawerEnableOpenDragGesture:
                  kIsWeb ? false : endDrawerEnableOpenDragGesture ?? true,
              extendBody: true),
        ),
        onWillPop: () async => await onWillPop());
  }
}
