import 'package:bookly_full_app_mvvm/core/utils/colors.dart';
import 'package:bookly_full_app_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.obscureText,
    required this.textInputType,
    required this.validator,
    this.onChanged,
  });
  final String hintText;
  final Icon prefixIcon;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
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
    );
  }
}
