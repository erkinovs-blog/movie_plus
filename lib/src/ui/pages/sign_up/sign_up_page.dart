import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';
import 'package:movie_plus_app/src/common/constants/app_icons.dart';
import 'package:movie_plus_app/src/ui/pages/splash/widgets/custom_splash_button.dart';
import 'package:movie_plus_app/src/ui/utils/functions.dart';
import 'package:movie_plus_app/src/ui/widgets/custom_text_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      body: SizedBox.expand(
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
                      controller: emailController,
                      hintText: translate(context).email,
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Email kiritish majburiy";
                          } else {
                            return null;
                          }
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: passwordController,
                      hintText: translate(context).password,
                      isPassword: true,
                      validator: (value) {
                        if (value != null) {
                          if (value.isEmpty) {
                            return "Password kiritish majburiy";
                          } else {
                            return null;
                          }
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? true) {
                    print("yaxshi");
                  } else {
                    print("yomon");
                  }
                },
                text: "Sign up",
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
    );
  }
}
