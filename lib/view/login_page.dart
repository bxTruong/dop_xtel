import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_all_fe/common/core/sys/base_option_dropdown.dart';
import 'package:shop_all_fe/common/core/widget/base_dropdown.dart';
import 'package:shop_all_fe/common/core/widget/base_textformfield.dart';
import 'package:shop_all_fe/common/core/widget/main_view.dart';
import 'package:shop_all_fe/common/export_this.dart';
import 'login_controller.dart';

class LoginPage extends BaseView<LoginController> {
  LoginPage({Key? key}) : super(key: key);
  final _controller = Get.lazyPut(() => LoginController());
  final _key = GlobalKey();

  @override
  Widget buildSuccess(BuildContext context) {
    return MainView(
      noAppBar: Container(),
      body: Container(
        child: Center(
          child: Column(
            children: [
              // Text(
              //   'Đăng nhập thành công',
              //   style: appStyle.textTheme.headline1,
              // ),
              // BaseElevatedButton(
              //   onTab: () {},
              //   title: 'Elevate Button',
              //   borderRadiusValue: 8,
              // ),
              // BaseTextButton(
              //   onTab: () {},
              //   title: 'Text Button',
              // ),
              // BaseOutlinedButton(
              //   onTab: () {},
              //   title: 'Outlined Button',
              //   borderRadiusValue: 30,
              // ),
              // BaseInkWell(
              //   title: 'Click me',
              //   borderRadiusValue: 10,
              //   dottedDecoration: DottedDecoration(
              //     shape: Shape.box,
              //     dash: <int>[1, 4],
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   onTab: () {},
              // ),
              // BaseImage.asserts(
              //     width: 240,
              //     height: 240,
              //     path: ImageResource.abc,
              //     borderRadiusValue: 8,
              //     boxFit: BoxFit.cover),

              // Utils.space(0, 10),
              // BaseTextFormField(
              //   editingController: controller.ted1,
              //   label: 'ABC',
              //   hint: 'CDE',
              //   suffixIcon: Icon(Icons.call),
              //   onFieldSubmitted: (value) {
              //     FocusScope.of(context).nextFocus();
              //   },
              //   textInputAction: TextInputAction.next,
              // ),
              // BaseTextFormField(
              //   editingController: controller.ted2,
              //   label: 'ABC',
              //   hint: 'CDE',
              //   suffixIcon: Icon(Icons.call),
              //   onFieldSubmitted: (value) {
              //     FocusScope.of(context).unfocus();
              //   },
              //   textInputAction: TextInputAction.go,
              // ),
              // TextFormField(
              //   textInputAction: TextInputAction.next,
              //   decoration: const InputDecoration(
              //     labelText: 'Input 1',
              //   ),
              // ),
              // TextFormField(
              //   textInputAction: TextInputAction.done,
              //   decoration: const InputDecoration(
              //     labelText: 'Input 2',
              //   ),
              // ),

              DropdownCustom(
                listItems: [
                  BaseOptionDropdown(id: '1', name: '1adfgdfsgdasfdasfdsfdasfsdfasfdasfsfdsfdsfdasfdsfdsfdsfdsffaadsfdsfdsfdsfsdfasdfdasfdssdfdasf'),
                  BaseOptionDropdown(id: '2', name: '2adfgdfsgdasfdasfdsfdasfsdfasfdasfsfdsfdsfdasfdsfdsfdsfdsffaadsfdsfdsfdsfsdfasdfdasfdssdfdasf'),
                  BaseOptionDropdown(id: '3', name: '3adfgdfsgdasfdasfdsfdasfsdfasfdasfsfdsfdsfdasfdsfdsfdsfdsffaadsfdsfdsfdsfsdfasdfdasfdssdfdasf')
                ],
                isBorder: true,
                label: 'Chọn',
                onTapCallBack:(value, index){
                  print('${value.name} $index');
                } ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
