import 'package:get/get.dart';

import '../controllers/color_scheme_controller.dart';

class ColorSchemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ColorSchemeController>(
      () => ColorSchemeController(),
    );
  }
}
