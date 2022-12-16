import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:recycle/const/borders/project_borders.dart';
import 'package:recycle/const/colors/project_colors.dart';
import 'package:recycle/const/padding/project_paddings.dart';
import 'package:recycle/const/paths/image_paths.dart';
import 'package:recycle/const/strings/global_navigator_name.dart';
import 'package:recycle/const/strings/login_strings.dart';
import 'package:recycle/ui/shared/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with ProjectPaddings, ProjectColors, LoginStrings, ImagePath, NavigatorName {
  GlobalKey<FormState> globalKey = GlobalKey();
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
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: globalKey,
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
                  validator: (value) => (value?.isValidEmail ?? false) ? null : 'Write your email',
                  hintText: hintEmail,
                  isObscure: false,
                  labelText: labelEmail,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  textAction: TextInputAction.done,
                  validator: (value) => (value?.isValidPassword ?? false) ? null : 'Please write password',
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
                      onPressed: () {
                        context.navigateName(registerPath);
                      },
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
                  child: Padding(
                    padding: paddingAll12,
                    child: Text(buttonSigIn,
                        style: GoogleFonts.aleo(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ),
                  onPressed: () {
                    if (globalKey.currentState?.validate() ?? false) {}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
