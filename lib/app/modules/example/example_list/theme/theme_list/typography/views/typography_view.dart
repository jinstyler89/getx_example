import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_example/app/common/values/color_schemes.g.dart';
import 'package:getx_example/app/common/values/theme.dart';
import 'package:getx_example/app/models/key_value_model.dart';
import 'package:getx_example/app/services/global.dart';

import '../controllers/typography_controller.dart';

class TypographyView extends GetView<TypographyController> {
  const TypographyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.viewTitle)),
      body: SafeArea(
        child: _buildView(),
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

  Widget _buildView() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int pos) {
        var item = controller.items[pos];
        return _buildListItem(item);
      },
      separatorBuilder: (BuildContext context, int pos) {
        return const Divider();
      },
      itemCount: controller.items.length,
    );
  }

  Widget _buildListItem(KeyValueModel<TextStyle?> item) {
    return ListTile(
      title: Text(
        "${item.key}, ${item.value?.fontSize}",
        style: item.value,
      ),
    );
  }
}
