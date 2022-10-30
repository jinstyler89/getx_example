import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_example/app/models/key_value_model.dart';
import 'package:getx_example/app/services/global.dart';

import '../controllers/theme_controller.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const ThemeView();
  }
}

class ThemeView extends GetView<ThemeController> {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      id: "theme",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
              title: const Text(
            "Material Design 3 规范",
          )),
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
      },
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

  Widget _buildListItem(KeyValueModel<String> item) {
    return ListTile(
      onTap: () => controller.onToRouter(item),
      title: Text(
        item.key,
        // style: Get.textTheme.labelLarge,
      ),
    );
  }
}
