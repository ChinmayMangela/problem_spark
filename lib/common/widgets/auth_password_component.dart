import 'package:flutter/material.dart';

import '../../features/auth/presentation/widgets/auth_text_field.dart';
import '../../utils/helper_functions.dart';

class AuthPasswordComponent extends StatelessWidget {
  const AuthPasswordComponent({super.key, required this.passwordController, required this.obscurePassword, required this.onTogglePasswordState});

  final TextEditingController passwordController;
  final bool obscurePassword;
  final void Function() onTogglePasswordState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Password'),
        const SizedBox(height: 7),
        AuthTextField(
          controller: passwordController,
          hintText: 'Enter your password',
          isPasswordField: true,
          obscureText: obscurePassword,
          onTogglePasswordState: onTogglePasswordState,
          validator: (value) {
            return HelperFunctions.passwordValidator(value);
          },
        ),
      ],
    );
  }
}
