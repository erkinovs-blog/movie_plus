import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/constants/app_icons.dart';
import 'package:movie_plus_app/src/common/routes/app_routes.dart';
import 'package:movie_plus_app/src/common/utils/validator/text_field_validator.dart';
import 'package:movie_plus_app/src/ui/controllers/translate/translate.dart';
import 'package:movie_plus_app/src/ui/pages/auth/bloc/auth_bloc.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/custom_splash_button.dart';
import 'package:movie_plus_app/src/ui/utils/functions.dart';
import 'package:movie_plus_app/src/ui/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
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
                        await context.read<AuthBloc>().login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                        if (!mounted) return;
                        Navigator.pushNamed(context, AppRoutes.home);
                      } on FirebaseAuthException catch (e) {
                        if (!mounted) return;
                        showSnackBar(
                          context: context,
                          text: e.message ?? e.code,
                        );
                      }
                    }
                  },
                  text: Translate(
                    builder: (context, l10n, child) {
                      return Text(
                        l10n.login,
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
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: AppColors.white70,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
