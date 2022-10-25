import 'package:get/get.dart';

import '../controllers/material_color_controller.dart';

class MaterialColorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MaterialColorController>(
      () => MaterialColorController(),
    );
  }
}
