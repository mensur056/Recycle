import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:recycle/features/screens/home/cubit/home_cubit.dart';
import 'package:recycle/features/screens/home/service/general_service.dart';
import 'package:recycle/product/const/borders/project_borders.dart';
import 'package:recycle/product/const/colors/project_colors.dart';
import 'package:recycle/product/const/padding/project_paddings.dart';
import 'package:recycle/product/const/paths/image_paths.dart';
import 'package:recycle/product/const/strings/global_navigator_name.dart';
import 'package:recycle/product/const/strings/login_strings.dart';
import 'package:recycle/features/shared/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with ProjectPaddings, ProjectColors, LoginStrings, ImagePath, NavigatorName {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(HomeService(Dio(BaseOptions(baseUrl: 'https://recycle-d84ec-default-rtdb.firebaseio.com/')))),
      child: Stack(children: [
        Image.asset(
          testImages,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: _loginBody(context),
        ),
      ]),
    );
  }

  Widget _loginBody(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
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
                  controller: emailController,
                  validator: (value) => (value?.isValidEmail ?? false) ? null : 'Write your email',
                  hintText: hintEmail,
                  isObscure: false,
                  labelText: labelEmail,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: passwordController,
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
                      backgroundColor: (globalKey.currentState?.validate() ?? false) ? null : Colors.grey.shade400,
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
        );
      },
    );
  }
}
