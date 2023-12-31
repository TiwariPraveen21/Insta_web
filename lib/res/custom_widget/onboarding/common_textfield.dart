import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.formvalidator,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.onFieldSubmitted,
    required this.obscureText,
    this.textInputAction,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? formvalidator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: formvalidator,
      focusNode: focusNode,
      textInputAction: textInputAction,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(10)),
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}