import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_example/app/models/key_value_model.dart';

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
