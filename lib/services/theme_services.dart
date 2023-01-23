import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final storage = GetStorage();
  final _key = 'isDarkMode';

  _saveThemeToStorage(bool isDarkMode) {
    storage.write(_key, isDarkMode);
  }

  _loadThemeFromStorage() {
    return storage.read<bool>(_key) ?? false;
  }

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromStorage() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToStorage(!_loadThemeFromStorage());
  }

  ThemeMode get theme => _loadThemeFromStorage() ? ThemeMode.dark : ThemeMode.light;
}
