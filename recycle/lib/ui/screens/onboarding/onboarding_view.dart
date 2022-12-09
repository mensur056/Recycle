import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle/const/padding/home_padding.dart';
import 'package:recycle/const/strings/home_strings.dart';
import 'package:recycle/const/strings/image_path.dart';

class OnboardingView extends StatelessWidget with ImagePath, HomeString, HomePadding {
  OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImage,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
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
                        const Shadow(blurRadius: 5, color: Color.fromARGB(255, 19, 115, 22)),
                      ]),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () {},
                    child: Text(continueTextButton),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
