import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle/product/const/padding/project_paddings.dart';
import 'package:recycle/product/const/paths/image_paths.dart';
import 'package:recycle/product/const/strings/home_strings.dart';
import 'package:recycle/features/screens/login/login_view.dart';

// ignore: must_be_immutable
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> with ImagePath, HomeString, ProjectPaddings {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const LoginView();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
          backgroundImage,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: paddingAll24,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      welcome,
                      style: GoogleFonts.aleo(color: Colors.green, fontSize: 36, shadows: [
                        const Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 5,
                          color: Color.fromARGB(255, 19, 115, 22),
                        ),
                      ]),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
