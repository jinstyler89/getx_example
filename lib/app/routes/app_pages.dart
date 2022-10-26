import 'package:get/get.dart';
import 'package:getx_example/app/modules/theme/theme_list/material_color/bindings/material_color_binding.dart';
import 'package:getx_example/app/modules/theme/theme_list/material_color/views/material_color_view.dart';

import '../modules/theme/theme_list/color_scheme/bindings/color_scheme_binding.dart';
import '../modules/theme/theme_list/color_scheme/views/color_scheme_view.dart';
import '../modules/dio/bindings/dio_binding.dart';
import '../modules/dio/views/dio_view.dart';
import '../modules/example_list/bindings/example_list_binding.dart';
import '../modules/example_list/views/example_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/theme/theme_list/loacl_appbar/bindings/loacl_appbar_binding.dart';
import '../modules/theme/theme_list/loacl_appbar/views/loacl_appbar_view.dart';
import '../modules/theme/bindings/theme_binding.dart';
import '../modules/theme/views/theme_view.dart';
import '../modules/theme/theme_list/typography/bindings/typography_binding.dart';
import '../modules/theme/theme_list/typography/views/typography_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EXAMPLE_LIST,
      page: () => const ExampleListView(),
      binding: ExampleListBinding(),
    ),
    GetPage(
      name: _Paths.DIO,
      page: () => const DioView(),
      binding: DioBinding(),
    ),
    // GetPage(
    //   name: _Paths.THEME,
    //   page: () => const ThemeView(),
    //   binding: ThemeBinding(),
    // ),
    GetPage(
      name: _Paths.THEME,
      page: () => const ThemePage(),
      binding: ThemeBinding(),
    ),
    GetPage(
      name: _Paths.TYPOGRAPHY,
      page: () => const TypographyView(),
      binding: TypographyBinding(),
    ),
    GetPage(
      name: _Paths.COLOR_SCHEME,
      page: () => const ColorSchemeView(),
      binding: ColorSchemeBinding(),
    ),
    GetPage(
      name: _Paths.LOACL_APPBAR,
      page: () => const LoaclAppbarView(),
      binding: LoaclAppbarBinding(),
    ),
    GetPage(
      name: _Paths.MATERIAL_COLOR,
      page: () => const MaterialColorView(),
      binding: MaterialColorBinding(),
    ),
  ];
}
