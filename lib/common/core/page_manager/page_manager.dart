import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/page_manager/key_page.dart';

List<GetPage> listPage = [
  GetPage(name: KeyPage.initial_page, page: () => Container()),
  GetPage(name: KeyPage.login_page, page: () => Container()),
];
