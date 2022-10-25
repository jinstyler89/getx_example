import 'package:get/get.dart';

import '../controllers/example_list_controller.dart';

class ExampleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleListController>(
      () => ExampleListController(),
    );
  }
}
