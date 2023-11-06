import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/constants/app_icons.dart';
import 'package:movie_plus_app/src/common/routes/app_routes.dart';
import 'package:movie_plus_app/src/common/utils/validator/text_field_validator.dart';
import 'package:movie_plus_app/src/ui/controllers/translate/translate.dart';
import 'package:movie_plus_app/src/ui/pages/auth/bloc/auth_bloc.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/custom_splash_button.dart';
import 'package:movie_plus_app/src/ui/widgets/custom_text_field.dart';

import '../../../utils/functions.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late TextEditingController nicknameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    nicknameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nicknameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Spacer(),
                SvgPicture.asset(AppIcons.icLogo),
                const Spacer(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: nicknameController,
                        hintText: translate(context).nickname,
                        validator: (value) =>
                            TextFieldValidator.validateName(context, value),
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: emailController,
                        hintText: translate(context).email,
                        validator: (value) =>
                            TextFieldValidator.validateEmail(context, value),
                      ),
                      const SizedBox(height: 12),
                      CustomTextField(
                        controller: passwordController,
                        hintText: translate(context).password,
                        isPassword: true,
                        validator: (value) =>
                            TextFieldValidator.validatePassword(context, value),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? true) {
                      try {
                        await context.read<AuthBloc>().signUp(
                              name: nicknameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );
                        if(!mounted) return;
                        Navigator.pushNamed(context, AppRoutes.home);
                      } on FirebaseAuthException catch (e) {
                        if(!mounted) return;
                        showSnackBar(context: context, text: e.message ?? e.code);
                      }
                    }
                  },
                  text: Translate(
                    builder: (context, l10n, child) {
                      return Text(
                        l10n.singUp,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                  isOutlined: true,
                ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: const Padding(
                //       padding: EdgeInsets.symmetric(vertical: 12),
                //       child: Text(
                //         "Forgot password?",
                //         style: TextStyle(
                //           color: AppColors.white70,
                //           fontWeight: FontWeight.w800,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const Spacer(flex: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
