import 'package:flutter/material.dart';
import 'package:recycle/const/borders/project_borders.dart';

class ProjectTheme {
  static ThemeData primaryTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: 72,
      shape: RoundedRectangleBorder(borderRadius: ProjectBorders.radiusCircularVertical44),
      shadowColor: Color.fromARGB(255, 10, 81, 13),
      backgroundColor: Colors.green,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
    ),
  );
}
