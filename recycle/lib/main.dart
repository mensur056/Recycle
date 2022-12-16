import 'package:flutter/material.dart';
import 'package:recycle/const/strings/global_navigator_name.dart';
import 'package:recycle/const/theme.dart';
import 'package:recycle/ui/screens/home/home_view.dart';
import 'package:recycle/ui/screens/login/login_view.dart';
import 'package:recycle/ui/screens/login/register_view.dart';
import 'package:recycle/ui/screens/onboarding/onboarding_view.dart';

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
      initialRoute: initialPath,
      routes: {
        initialPath: (context) => const OnboardingView(),
        homePath: (context) => const HomeView(),
        loginPath: (context) => const LoginView(),
        registerPath: (context) => const RegisterView(),
      },
    );
  }
}
