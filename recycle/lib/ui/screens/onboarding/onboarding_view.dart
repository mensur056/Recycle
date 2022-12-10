import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle/const/borders/project_borders.dart';
import 'package:recycle/const/padding/project_paddings.dart';
import 'package:recycle/const/strings/home_strings.dart';
import 'package:recycle/const/strings/image_path.dart';

// ignore: must_be_immutable
class OnboardingView extends StatelessWidget with ImagePath, HomeString, ProjectPaddings {
  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImage,
        ),
        Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(borderRadius: ProjectBorders.radiusCircular20),
            ),
            onPressed: () {},
            child: Padding(
              padding: paddingAll12,
              child: Text(
                continueTextButton,
                style: GoogleFonts.aleo(
                  color: Colors.white,
                  fontSize: 24,
                  shadows: [
                    const Shadow(offset: Offset(1, 1), blurRadius: 5, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ),
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
