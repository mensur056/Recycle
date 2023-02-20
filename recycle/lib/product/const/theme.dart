import 'package:flutter/material.dart';
import 'package:recycle/product/const/borders/project_borders.dart';

class ProjectTheme {
  static ThemeData lightThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: 72,
      shape: RoundedRectangleBorder(borderRadius: ProjectBorders.radiusCircularVertical44),
      shadowColor: Color.fromARGB(255, 10, 81, 13),
      backgroundColor: Colors.green,
    ),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
    ),
  );
  static ThemeData darkThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: 72,
      shape: RoundedRectangleBorder(borderRadius: ProjectBorders.radiusCircularVertical44),
      shadowColor: Color.fromARGB(255, 10, 81, 13),
      backgroundColor: Colors.green,
    ),
    scaffoldBackgroundColor: Colors.grey,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
    ),
  );
}
