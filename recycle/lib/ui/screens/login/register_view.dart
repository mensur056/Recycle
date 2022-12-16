import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle/const/borders/project_borders.dart';
import 'package:recycle/const/colors/project_colors.dart';
import 'package:recycle/const/padding/project_paddings.dart';
import 'package:recycle/const/paths/image_paths.dart';
import 'package:recycle/const/strings/login_strings.dart';
import 'package:recycle/const/strings/register_strings.dart';
import 'package:recycle/ui/screens/login/login_view.dart';
import 'package:recycle/ui/shared/custom_textfield.dart';
import 'package:recycle/utility/abstract_class.dart';
import 'package:kartal/kartal.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ProjectLoading<RegisterView>
    with ImagePath, ProjectPaddings, LoginStrings, ProjectColors {
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          testImages,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(),
          body: Padding(
            padding: paddingAll32,
            child: SingleChildScrollView(
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: globalKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      RegisterStrings.singUp,
                      style: GoogleFonts.aleo(color: primaryColor, fontSize: 40),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      validator: (value) => (value?.isNotEmpty ?? false) ? null : 'Write your name',
                      hintText: hintName,
                      isObscure: false,
                      labelText: labelName,
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
                      height: 20,
                    ),
                    CustomTextField(
                      keyType: TextInputType.number,
                      validator: (value) => (value?.isNotEmpty ?? false) ? null : 'Write your number',
                      hintText: hintNumber,
                      isObscure: false,
                      labelText: labelNumber,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      textAction: TextInputAction.done,
                      validator: (value) =>
                          (value?.isValidPassword ?? false) ? null : 'Have to be long than 6 character ',
                      hintText: hintPassword,
                      isObscure: true,
                      labelText: labelPassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isLoading ? true : false,
                          onChanged: (val) {
                            changeLoading();
                          },
                        ),
                        Text(RegisterStrings.agree, style: GoogleFonts.actor(color: Colors.black))
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
                        child: Text(
                          RegisterStrings.singUp,
                          style: GoogleFonts.aleo(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (globalKey.currentState?.validate() ?? false) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginView(),
                            ),
                          );
                        }
                        print('sdfsd');
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
