import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/app/data/services/hive_services.dart';
import 'themes.dart';

class ThemeController extends GetxController {
  static const _key = 'isDarkMode';
  final _isDark = false.obs;

  ThemeMode get themeMode => _isDark.value ? ThemeMode.dark : ThemeMode.light;
  ThemeData get lightTheme => lightThemeData;
  ThemeData get darkTheme => darkThemeData;

  @override
  void onInit() {
    super.onInit();
    _isDark.value = HiveService.getBool(_key) ?? false;
  }

  void toggleTheme() {
    _isDark.value = !_isDark.value;
    HiveService.setBool(_key, _isDark.value);
    Get.changeThemeMode(_isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}
