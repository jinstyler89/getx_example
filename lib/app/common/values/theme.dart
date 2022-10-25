import 'package:flutter/material.dart';
import 'package:getx_example/app/common/values/color_schemes.g.dart';

class AppTheme {
  // 自定义主题颜色 设置 light 对象的属性 primarySwatch
  // static MaterialColor myColor = stringToMaterialColor("008744");
  static ThemeData light = ThemeData(
    colorScheme: lightColorScheme,
    // 全局 - 自定义  AppBarTheme  颜色 字体
    // appBarTheme: ThemeData.light().appBarTheme.copyWith(
    //       backgroundColor: Colors.yellow,
    //       titleTextStyle: ThemeData.light().textTheme.titleLarge?.copyWith(
    //             color: Colors.black,
    //             fontWeight: FontWeight.bold,
    //             fontSize: 20,
    //           ),
    //     ),
    //  primarySwatch: myColor, //自定义主题颜色 需设置MaterialColor =>stringToMaterialColor
  );

  static ThemeData dark = ThemeData(
    colorScheme: darkColorScheme,
  );
}
