import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loacl_appbar_controller.dart';

class LoaclAppbarView extends GetView<LoaclAppbarController> {
  const LoaclAppbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Get.theme;
    return Theme(
      data: theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(
          backgroundColor: theme.colorScheme.tertiary,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(controller.viewTitle),
        ),
        body: SafeArea(
          child: _buildView(),
        ),
      ),
    );
  }

  Widget _buildView() {
    return Container();
  }
}
