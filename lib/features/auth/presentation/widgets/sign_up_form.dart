import 'package:flutter/material.dart';
import 'package:problem_spark/common/widgets/auth_email_component.dart';
import 'package:problem_spark/common/widgets/auth_password_component.dart';
import 'package:problem_spark/common/widgets/custom_button.dart';
import 'package:problem_spark/constants/string_constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = false;


  void _onForgotPasswordTap() {}

  void _onSignInTap() {}

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmailComponent(),
            const SizedBox(height: 15),
            _buildPasswordComponent(),
            const SizedBox(height: 10),
            _buildForgotPasswordButton(),
            const SizedBox(height: 10),
            CustomButton(label: signIn, onTap: _onSignInTap),
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
