import 'package:flutter/material.dart';

import '../../features/auth/presentation/widgets/auth_text_field.dart';
import '../../utils/helper_functions.dart';
import '../dimen.dart';

class AuthConfirmPasswordComponent extends StatelessWidget {
  const AuthConfirmPasswordComponent({
    super.key,
    required this.passwordController,
    required this.obscurePassword,
    required this.onTogglePasswordState,
    required this.password,
  });

  final TextEditingController passwordController;
  final bool obscurePassword;
  final void Function() onTogglePasswordState;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextThemes(
            context,
          ).labelMedium.copyWith(fontWeight: TextWeights.w900),
        ),
        const SizedBox(height: 7),
        AuthTextField(
          controller: passwordController,
          hintText: 'Enter your password',
          isPasswordField: true,
          obscureText: obscurePassword,
          onTogglePasswordState: onTogglePasswordState,
          validator: (value) {
            return HelperFunctions.confirmPasswordValidator(value, password);
          },
        ),
      ],
    );
  }
}
