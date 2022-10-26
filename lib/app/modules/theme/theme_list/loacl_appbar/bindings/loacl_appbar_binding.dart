import 'package:get/get.dart';

import '../controllers/loacl_appbar_controller.dart';

class LoaclAppbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoaclAppbarController>(
      () => LoaclAppbarController(),
    );
  }
}
