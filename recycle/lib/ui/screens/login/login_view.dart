import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle/const/borders/project_borders.dart';
import 'package:recycle/const/colors/project_colors.dart';
import 'package:recycle/const/padding/project_paddings.dart';
import 'package:recycle/const/strings/image_path.dart';
import 'package:recycle/const/strings/login_strings.dart';
import 'package:recycle/ui/shared/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ProjectPaddings, ProjectColors, LoginStrings, ImagePath {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        testImages,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: paddingAll32,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                login,
                style: GoogleFonts.aleo(color: primaryColor, fontSize: 40),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: hintEmail,
                isObscure: false,
                labelText: labelEmail,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: hintPassword,
                isObscure: true,
                labelText: labelPassword,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(haveAccount),
                  TextButton(
                    onPressed: () {},
                    child: Text(buttonSigUp),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(borderRadius: ProjectBorders.radiusCircular20)),
                onPressed: () {},
                child: Padding(
                  padding: paddingAll12,
                  child: Text(buttonSigIn,
                      style: GoogleFonts.aleo(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
