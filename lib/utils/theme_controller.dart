import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _box = GetStorage();
  final _key = 'themeMode';

  ThemeMode themeMode = ThemeMode.system;

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  void _loadTheme() {
    String? savedTheme = _box.read(_key);

    if (savedTheme == 'light') {
      themeMode = ThemeMode.light;
    } else if (savedTheme == 'dark') {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.system;
    }
  }

  bool isDarkMode() => themeMode == ThemeMode.dark;

  void toggleTheme() {
    if (isDarkMode()) {
      setTheme(ThemeMode.light);
    } else {
      setTheme(ThemeMode.dark);
    }
  }

  void setTheme(ThemeMode mode) {
    themeMode = mode;

    if (mode == ThemeMode.light) {
      _box.write(_key, 'light');
    } else if (mode == ThemeMode.dark) {
      _box.write(_key, 'dark');
    } else {
      _box.write(_key, 'system');
    }

    Get.changeThemeMode(mode);
    update();
  }
}
