import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_example/app/common/values/color_schemes.g.dart';
import 'package:getx_example/app/common/values/theme.dart';
import 'package:getx_example/app/services/global.dart';

import '../controllers/example_controller.dart';

class ExampleView extends GetView<ExampleController> {
  const ExampleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ThemeData theme = Get.theme;

    return Scaffold(
      body: Container(
        // color: theme.primaryColor,
        child: Column(
          children: [
            _example('dio', 'dio'),
            const Divider(),
            _example('theme', 'theme'),
            const Divider(),
            _example('syncfusionCalendar', 'syncfusion-calendar'),
            const Divider(),
            _example('syncfusionDatepicker', 'syncfusion-datepicker'),
          ],
        ),
      ),
      floatingActionButton: Obx(() {
        return FloatingActionButton(
          onPressed: () {
            GlobalService.to.switchThemeModel();
          },
          child: Icon(
            GlobalService.to.isDarkModel == true
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
        );
      }),
    );
  }

  Widget _example(String name, String view) {
    // TextTheme tt = Get.textTheme;

    return TextButton(
      onPressed: (() => Get.toNamed('/$view')),
      child: SizedBox(
        height: 40,
        width: Get.width,
        // color: ,
        child: Text(name),
      ),
    );
  }
}
