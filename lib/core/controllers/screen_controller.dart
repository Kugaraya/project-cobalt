import 'package:flutter/material.dart';
import 'package:project_cobalt/screens/dashboard/dashboard_screen.dart';

class ScreenController extends ChangeNotifier {
  Widget _activeScreen = DashboardScreen();
  Widget get activeScreen => _activeScreen;

  set activeScreen(Widget screen) {
    _activeScreen = screen;
    notifyListeners();
  }
}
