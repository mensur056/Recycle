import 'package:flutter/material.dart';
import 'package:recycle/product/const/strings/global_navigator_name.dart';
import 'package:recycle/product/const/theme.dart';
import 'package:recycle/features/screens/login/register_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with NavigatorName {
  MyApp({super.key});
  final String title = 'Recycle';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ProjectTheme.primaryTheme,
      // initialRoute: registerPath,
      // routes: {
      //   initialPath: (context) => const OnboardingView(),
      //   homePath: (context) => const HomeView(),
      //   loginPath: (context) => const LoginView(),
      //   registerPath: (context) => const RegisterView(),
      // },
      home: const RegisterView(),
    );
  }
}
