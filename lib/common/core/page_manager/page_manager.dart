import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:app_shopee_lite/common/core/page_manager/key_page.dart';

List<GetPage> listPage = [
  GetPage(name: KeyPage.initial_page, page: () => Container()),
  GetPage(name: KeyPage.login_page, page: () => Container()),
];
