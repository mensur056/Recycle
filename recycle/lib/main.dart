import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle/features/screens/home/home_view.dart';
import 'package:recycle/features/screens/home/provider/home_view_provider.dart';
import 'package:recycle/product/const/strings/global_navigator_name.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (context) => HomeViewProvider(),
  ));
}

class MyApp extends StatelessWidget with NavigatorName {
  MyApp({super.key});
  final String title = 'Recycle';
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewProvider>(
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: value.currentTheme,
          // initialRoute: registerPath,
          // routes: {
          //   initialPath: (context) => const OnboardingView(),
          //   homePath: (context) => const HomeView(),
          //   loginPath: (context) => const LoginView(),
          //   registerPath: (context) => const RegisterView(),
          // },
          home: const HomeView(),
        );
      },
    );
  }
}
