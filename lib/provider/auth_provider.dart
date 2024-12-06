import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _savedText = "";

  bool get isLoggedIn => _isLoggedIn;
  String get savedText => _savedText;

  AuthProvider() {
    loadAuth();
  }

  void loadAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _savedText = prefs.getString('savedText') ?? "";
    notifyListeners();
  }

  void setAuth(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = status;
    await prefs.setBool('isLoggedIn', status);
    notifyListeners();
  }

  void saveText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _savedText = text;
    await prefs.setString('savedText', text);
    notifyListeners();
  }
}
