import 'package:flutter/material.dart';
import 'package:problem_spark/constants/icon_constants.dart';
import '../../../../constants/color_constants.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.isPasswordField,
    this.onTogglePasswordState,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final bool obscureText;
  final void Function()? onTogglePasswordState;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: black,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        fillColor: lightGrey,
        filled: true,
        hintText: hintText,
        suffixIcon: _buildTrailingIconButton(),
        prefixIcon: _buildLeadingIcon(),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget? _buildTrailingIconButton() {
    return isPasswordField
        ? IconButton(
            onPressed: onTogglePasswordState,
            icon: Icon(obscureText ? eyeSlashIcon : eyeIcon),
          )
        : null;
  }

  Widget? _buildLeadingIcon() {
    return Icon(isPasswordField ? lockIcon : emailIcon);
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none
    );
  }
}
