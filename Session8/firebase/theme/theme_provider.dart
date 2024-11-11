
import 'package:firebase_project/theme/themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  void setTheme(ThemeData theme){
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme(){
    _themeData = _themeData == lightMode ? darkMode : lightMode;
    notifyListeners();
  }

}