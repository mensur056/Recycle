import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recycle/features/screens/home/cubit/home_cubit.dart';
import 'package:recycle/features/screens/home/model/user_model.dart';
import 'package:recycle/features/screens/home/service/general_service.dart';
import 'package:recycle/product/const/borders/project_borders.dart';
import 'package:recycle/product/const/colors/project_colors.dart';
import 'package:recycle/product/const/padding/project_paddings.dart';
import 'package:recycle/product/const/paths/image_paths.dart';
import 'package:recycle/product/const/strings/login_strings.dart';
import 'package:recycle/product/const/strings/register_strings.dart';
import 'package:recycle/features/screens/login/login_view.dart';
import 'package:recycle/features/shared/custom_textfield.dart';
import 'package:recycle/product/network/user_network.dart';
import 'package:recycle/product/utility/abstract_class.dart';
import 'package:kartal/kartal.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ProjectLoading<RegisterView>
    with ImagePath, ProjectPaddings, LoginStrings, ProjectColors {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeService(UserNetworkManager())),
      child: Stack(
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
            body: _registerBody(context),
          ),
        ],
      ),
    );
  }

  Widget _registerBody(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
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
                    controller: userNameController,
                    validator: (value) => (value?.isNotEmpty ?? false) ? null : 'Write your name',
                    hintText: hintName,
                    isObscure: false,
                    labelText: labelName,
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
                    height: 20,
                  ),
                  CustomTextField(
                    controller: numberController,
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
                    controller: passwordController,
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
                        final model = UserModel(
                            email: emailController.text,
                            password: int.tryParse(passwordController.text),
                            userName: userNameController.text,
                            number: int.tryParse(numberController.text));
                        context.read<HomeCubit>().sendUserModelInfo(model);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
