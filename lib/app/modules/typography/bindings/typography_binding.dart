import 'package:get/get.dart';

import '../controllers/typography_controller.dart';

class TypographyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TypographyController>(
      () => TypographyController(),
    );
  }
}
