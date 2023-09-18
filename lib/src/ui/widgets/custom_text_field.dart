import 'package:flutter/material.dart';
import 'package:movie_plus_app/src/common/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.validator,
    this.isPassword = false,
    super.key,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final FormFieldValidator<String> validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure;

  @override
  void initState() {
    isObscure = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide.none,
        ),
        suffix: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: const Text(
                  "show",
                  style: TextStyle(
                    color: AppColors.black,
                  ),
                ),
              )
            : null,
        errorStyle: const TextStyle(
          color: AppColors.white,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColors.black50,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          height: 2,
        ),
        filled: true,
        fillColor: AppColors.white,
      ),
      obscureText: isObscure,
      validator: widget.validator,
    );
  }
}
