import 'package:flutter/material.dart';

import '../../features/auth/presentation/widgets/auth_text_field.dart';
import '../../utils/helper_functions.dart';

class AuthEmailComponent extends StatelessWidget {
  const AuthEmailComponent({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email'),
        const SizedBox(height: 7),
        AuthTextField(
          controller: emailController,
          hintText: 'Enter your email',
          isPasswordField: false,
          validator: (value) {
            return HelperFunctions.emailValidator(value);
          },
        ),
      ],
    );
  }
}
