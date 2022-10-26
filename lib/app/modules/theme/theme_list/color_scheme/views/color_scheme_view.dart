import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_example/app/models/key_value_model.dart';

import '../controllers/color_scheme_controller.dart';

class ColorSchemeView extends GetView<ColorSchemeController> {
  const ColorSchemeView({Key? key}) : super(key: key);
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
    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 1,
      children: List.generate(controller.items.length, (index) {
        var item = controller.items[index];
        return _buildListItem(item);
      }),
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
                    ? Colors.black
                    : Colors.white,
              ),
            ),
    );
  }
}
