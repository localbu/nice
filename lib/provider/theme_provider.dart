import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // default is light mode
  bool _isDarkMode = false;

  bool get isDarkMode => this._isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }

  void toggleTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = isDark;
    // set bool => key & value
    await prefs.setBool('isDarkMode', isDark);
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // getBool => key
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }
}
