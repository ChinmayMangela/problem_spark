import 'package:flutter/material.dart';
import 'package:problem_spark/common/widgets/auth_confirm_password_component.dart';
import 'package:problem_spark/common/widgets/auth_email_component.dart';
import 'package:problem_spark/common/widgets/auth_password_component.dart';
import 'package:problem_spark/common/widgets/custom_button.dart';
import 'package:problem_spark/constants/string_constants.dart';

import '../../../../common/dimen.dart';
import '../../../../utils/helper_functions.dart';
import 'auth_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final _formKey = GlobalKey<FormState>();


  void _onSignUpTap() {
    if(_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final confirmPassword = _confirmPasswordController.text.trim();

      HelperFunctions.showSnackBar(
        'Name: $name\nEmail: $email\nPassword: $password\nConfirm Password: $confirmPassword'
      );
    }
  }

  void _onTogglePasswordState() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _onToggleConfirmPasswordState() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
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
            _buildNameComponent(),
            const SizedBox(height: 15),
            _buildEmailComponent(),
            const SizedBox(height: 15),
            _buildPasswordComponent(),
            const SizedBox(height: 15),
            _buildConfirmPasswordComponent(),
            const SizedBox(height: 15),
            CustomButton(label: signIn, onTap: _onSignUpTap),
          ],
        ),
      ),
    );
  }

  Widget _buildNameComponent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name', style: TextThemes(context).labelMedium.copyWith(
            fontWeight: TextWeights.w900
        ),),
        const SizedBox(height: 7),
        AuthTextField(
          controller: _nameController,
          hintText: 'Enter your Name',
          isPasswordField: false,
          validator: (value) {
            return HelperFunctions.nameValidator(value);
          },
        ),
      ],
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

  Widget _buildConfirmPasswordComponent() {
    return AuthConfirmPasswordComponent(
      passwordController: _confirmPasswordController,
      obscurePassword: _obscureConfirmPassword,
      onTogglePasswordState: _onToggleConfirmPasswordState,
      password: _passwordController.text.trim(),
    );
  }
}
