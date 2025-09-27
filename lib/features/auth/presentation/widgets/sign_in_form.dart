import 'package:flutter/material.dart';
import 'package:problem_spark/common/widgets/auth_email_component.dart';
import 'package:problem_spark/common/widgets/auth_password_component.dart';
import 'package:problem_spark/common/widgets/custom_button.dart';
import 'package:problem_spark/constants/string_constants.dart';

import '../../../../utils/helper_functions.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = false;
  final _formKey = GlobalKey<FormState>();


  void _onForgotPasswordTap() {}

  void _onSignUpTap() {
    if(_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      HelperFunctions.showSnackBar(
          'Email: $email\nPassword: $password'
      );
    }
  }

  void _onTogglePasswordState() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmailComponent(),
            const SizedBox(height: 15),
            _buildPasswordComponent(),
            const SizedBox(height: 10),
            _buildForgotPasswordButton(),
            const SizedBox(height: 10),
            CustomButton(label: signIn, onTap: _onSignUpTap),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailComponent() {
    return AuthEmailComponent(emailController: _emailController);
  }

  Widget _buildPasswordComponent() {
    return AuthPasswordComponent(
      passwordController: _passwordController,
      obscurePassword: _obscurePassword,
      onTogglePasswordState: _onTogglePasswordState,
    );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: _onForgotPasswordTap,
        child: Text('Forgot Password?',),
      ),
    );
  }
}
