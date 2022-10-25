import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/app/models/key_value_model.dart';

class ColorSchemeController extends GetxController {
  final String viewTitle = Get.arguments["title"] ?? "no title name";
  List<KeyValueModel<Color>> items = [];

  _initData() {
    ColorScheme colorScheme = Get.theme.colorScheme;
    items = [
      // primary
      KeyValueModel<Color>("primary", colorScheme.primary),
      KeyValueModel<Color>("onPrimary", colorScheme.onPrimary),
      KeyValueModel<Color>("primaryContainer", colorScheme.primaryContainer),
      KeyValueModel<Color>(
          "onPrimaryContainer", colorScheme.onPrimaryContainer),

      // secondary
      KeyValueModel<Color>("secondary", colorScheme.secondary),
      KeyValueModel<Color>("onSecondary", colorScheme.onSecondary),
      KeyValueModel<Color>(
          "secondaryContainer", colorScheme.secondaryContainer),
      KeyValueModel<Color>(
          "onSecondaryContainer", colorScheme.onSecondaryContainer),

      // tertiary
      KeyValueModel<Color>("tertiary", colorScheme.tertiary),
      KeyValueModel<Color>("onTertiary", colorScheme.onTertiary),
      KeyValueModel<Color>("tertiaryContainer", colorScheme.tertiaryContainer),
      KeyValueModel<Color>(
          "onTertiaryContainer", colorScheme.onTertiaryContainer),

      // error
      KeyValueModel<Color>("error", colorScheme.error),
      KeyValueModel<Color>("onError", colorScheme.onError),
      KeyValueModel<Color>("errorContainer", colorScheme.errorContainer),
      KeyValueModel<Color>("onErrorContainer", colorScheme.onErrorContainer),

      // background
      KeyValueModel<Color>("background", colorScheme.background),
      KeyValueModel<Color>("onBackground", colorScheme.onBackground),
      KeyValueModel<Color>("", Colors.transparent),
      KeyValueModel<Color>("", Colors.transparent),

      // surface
      KeyValueModel<Color>("surface", colorScheme.surface),
      KeyValueModel<Color>("onSurface", colorScheme.onSurface),
      KeyValueModel<Color>("surfaceVariant", colorScheme.surfaceVariant),
      KeyValueModel<Color>("onSurfaceVariant", colorScheme.onSurfaceVariant),

      // outline
      KeyValueModel<Color>("outline", colorScheme.outline),
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
  //   // _initData();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

}
