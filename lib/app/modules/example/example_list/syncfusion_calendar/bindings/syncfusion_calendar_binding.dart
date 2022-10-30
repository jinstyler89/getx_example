import 'package:get/get.dart';

import '../controllers/syncfusion_calendar_controller.dart';

class SyncfusionCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SyncfusionCalendarController>(
      () => SyncfusionCalendarController(),
    );
  }
}
