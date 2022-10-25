import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_example/app/models/key_value_model.dart';

import '../controllers/material_color_controller.dart';

class MaterialColorView extends GetView<MaterialColorController> {
  const MaterialColorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(controller.viewTitle)),
      body: SafeArea(
        child: _buildView(),
      ),
    );
  }

  Widget _buildView() {
    return ListView.builder(
      itemExtent: 100,
      itemCount: controller.items.length,
      itemBuilder: (BuildContext context, int index) {
        var item = controller.items[index];
        return _buildListItem(item);
      },
    );
  }

  Widget _buildListItem(KeyValueModel<Color> item) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: item.value,
      child: item.key.isEmpty
          ? null
          : Text(
              "${item.key}, ${item.value}",
              style: TextStyle(
                color: item.value.computeLuminance() > 0.4
                    ? Get.theme.colorScheme.primary
                    : Get.theme.colorScheme.onPrimary,
              ),
            ),
    );
  }
}
