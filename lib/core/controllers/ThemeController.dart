import 'package:flutter/material.dart';
import 'package:project_cobalt/core/services/theme_service.dart';

class ThemeController extends ChangeNotifier {
  bool _isDark = true;
  ThemeService _themeService = ThemeService();
  bool get isDark => _isDark;


  set isDark(bool value) {
    _isDark = value;
    _themeService.setTheme(value);
    notifyListeners();
  }

  getTheme() async {
    _isDark = await _themeService.getTheme();
    notifyListeners();
  }
}
