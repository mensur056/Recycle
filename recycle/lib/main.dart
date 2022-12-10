import 'package:flutter/material.dart';
import 'package:recycle/const/theme.dart';
import 'package:recycle/ui/screens/login/register_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recycle',
      theme: ProjectTheme.primaryTheme,
      home: const RegisterView(),
    );
  }
}
