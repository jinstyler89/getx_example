import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/example_list_controller.dart';

class ExampleListView extends GetView<ExampleListController> {
  const ExampleListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _example('dio', 'dio'),
            _example('theme', 'theme'),
          ],
        ),
      ),
    );
  }

  Widget _example(String name, String view) {
    return TextButton(
      onPressed: (() => Get.toNamed('/$view')),
      child: Text(
        name,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
