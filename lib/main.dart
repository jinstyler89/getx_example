import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_example/app/common/values/theme.dart';
import 'package:getx_example/app/services/global.dart';

import 'app/routes/app_pages.dart';

// void main() {
//   runApp(
//     GetMaterialApp(
//       title: "Application",
//       initialRoute: AppPages.INITIAL,
//       getPages: AppPages.routes,
//     ),
//   );
// }
void main() {
  appInit();
}

appInit() async {
  // 初始 fluuter 引擎
  WidgetsFlutterBinding.ensureInitialized();
  // 初始
  Get.put<GlobalService>(GlobalService());
  // 启动
  runApp(
    GetMaterialApp(
      title: "Application",
      // 初始主题样式
      theme:
          GlobalService.to.isDarkModel == true ? AppTheme.dark : AppTheme.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
