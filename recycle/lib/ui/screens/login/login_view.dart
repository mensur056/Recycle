import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle/const/borders/project_borders.dart';
import 'package:recycle/const/colors/project_colors.dart';
import 'package:recycle/const/padding/project_paddings.dart';
import 'package:recycle/const/strings/login_strings.dart';
import 'package:recycle/ui/shared/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ProjectPaddings, ProjectColors, LoginStrings {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(borderRadius: ProjectBorders.radiusCircularVertical44),
      ),
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
            Row(
              children: [
                Text(haveAccount),
                TextButton(
                  onPressed: () {},
                  child: Text(buttonSigUp),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(buttonSigIn),
            )
          ],
        ),
      ),
    );
  }
}
