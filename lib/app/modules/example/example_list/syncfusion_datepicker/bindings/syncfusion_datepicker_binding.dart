import 'package:get/get.dart';

import '../controllers/syncfusion_datepicker_controller.dart';

class SyncfusionDatepickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SyncfusionDatepickerController>(
      () => SyncfusionDatepickerController(),
    );
  }
}
