import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final _box = GetStorage();
  final _key = "isDarkMode";

  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  ThemeMode get themeMode => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    // NOTE: save the opposite value theme
    _saveTheme(!_loadThemeFromBox());
  }

  void _saveTheme(bool isDarkMode) {
    _box.write(_key, isDarkMode);
  }
}
