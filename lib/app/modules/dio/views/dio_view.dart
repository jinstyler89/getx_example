import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dio_controller.dart';

class DioView extends GetView<DioController> {
  const DioView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DioView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(
            () => Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                color: Colors.green,
                child: Text(controller.getdata.value)),
          ),
          TextButton(
            onPressed: (() {
              controller.get();
            }),
            child: const Text(
              'Get',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.red,
            child: Text('Post===\n${controller.postdata.value}'),
          ),
          TextButton(
            onPressed: (() {
              controller.post();
            }),
            child: const Text(
              'Post',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
