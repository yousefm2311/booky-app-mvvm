import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.obscureText,
    required this.textInputType,
    required this.validator,
  });
  final String hintText;
  final Icon prefixIcon;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: textInputType,
        style: Styles.textStyle16,
        obscureText: obscureText,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            hintStyle: Styles.textStyle14,
            fillColor: AppColors.kGreyColor,
            suffixIcon: suffixIcon,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.white, width: 1),
            )),
      ),
    );
  }
}
