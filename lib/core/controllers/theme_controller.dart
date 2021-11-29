import 'package:flutter/material.dart';
import 'package:project_cobalt/core/providers/theme_provider.dart';

class ThemeController extends ChangeNotifier {
  bool _isDark = true;
  ThemeProvider _themeService = ThemeProvider();
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
