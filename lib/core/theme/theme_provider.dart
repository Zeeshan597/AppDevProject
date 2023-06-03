import 'package:aitebar/core/theme/theme_dark.dart';
import 'package:aitebar/core/theme/theme_light.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  late AppTheme _currentTheme;
  bool _isDarkMode = false;

  ThemeProvider(this._currentTheme);

  bool get isDarkMode => _isDarkMode;

  AppTheme get currentTheme => _currentTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? ThemeDark() : ThemeLight();
    notifyListeners();
  }
}
