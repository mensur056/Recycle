import 'package:flutter/material.dart';
import 'package:recycle/product/const/theme.dart';

class HomeViewProvider extends ChangeNotifier {
  double value = 0.5;
  bool isDark = false;
  ThemeData get currentTheme => isDark ? ProjectTheme.darkThemeData : ProjectTheme.lightThemeData;
  void changeThemeData() {
    isDark = !isDark;
    if (isDark == true) {
      value = 1;
      notifyListeners();
    }
    notifyListeners();
  }
}
