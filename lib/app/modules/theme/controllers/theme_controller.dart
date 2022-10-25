import 'package:get/get.dart';
import 'package:getx_example/app/models/key_value_model.dart';
import 'package:getx_example/app/routes/app_pages.dart';

class ThemeController extends GetxController {
  List<KeyValueModel<String>> items = [];

  _initData() {
    items.addAll([
      KeyValueModel<String>("ColorScheme 颜色", Routes.COLOR_SCHEME),
      KeyValueModel<String>("MaterialColor 色阶", Routes.MATERIAL_COLOR),
      KeyValueModel<String>("Typography 字体", Routes.TYPOGRAPHY),
      KeyValueModel<String>("AppBar 局部背景修改", Routes.LOACL_APPBAR),
    ]);

    update(["theme"]);
  }

  void onTap() {}

  void onToRouter(KeyValueModel<String> item) {
    Get.toNamed(
      item.value,
      arguments: {
        "title": item.key,
      },
    );
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
