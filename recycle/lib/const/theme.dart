import 'package:flutter/material.dart';

class ProjectTheme {
 static ThemeData primaryTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      shadowColor: Color.fromARGB(255, 10, 81, 13),
      backgroundColor: Colors.green,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
    ),
  );
}
