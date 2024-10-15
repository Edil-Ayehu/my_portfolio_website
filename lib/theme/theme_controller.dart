import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system; // Private variable

  ThemeMode get themeMode => _themeMode; // Public getter

  void toggleThemeMode() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners(); // Notify listeners of the change
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners(); // Notify listeners of the change
  }
}
