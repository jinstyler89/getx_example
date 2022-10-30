import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/app/common/values/color.dart';
import 'package:getx_example/app/common/values/string.dart';
import 'package:getx_example/app/models/key_value_model.dart';

class MaterialColorController extends GetxController {
  final String viewTitle = Get.arguments["title"] ?? "no title name";
  late final MaterialColor myColor;
  List<KeyValueModel<Color>> items = [];

  _initData() {
    /// 字符串转 MaterialColor
    myColor = "#B36200".toColor().materialColor;
    items = [
      KeyValueModel<Color>("50", myColor.shade50),
      KeyValueModel<Color>("100", myColor.shade100),
      KeyValueModel<Color>("200", myColor.shade200),
      KeyValueModel<Color>("300", myColor.shade300),
      KeyValueModel<Color>("400", myColor.shade400),
      KeyValueModel<Color>("500", myColor.shade500),
      KeyValueModel<Color>("600", myColor.shade600),
      KeyValueModel<Color>("700", myColor.shade700),
      KeyValueModel<Color>("800", myColor.shade800),
      KeyValueModel<Color>("900", myColor.shade900),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    _initData();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
