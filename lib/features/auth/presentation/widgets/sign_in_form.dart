import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // 💡 ADDED
import 'package:problem_spark/common/widgets/auth_email_component.dart';
import 'package:problem_spark/common/widgets/auth_password_component.dart';
import 'package:problem_spark/common/widgets/custom_button.dart';
import 'package:problem_spark/constants/string_constants.dart';
import 'package:problem_spark/features/auth/presentation/screens/forget_password_screen.dart';

import '../../../../common/dimen.dart';
import '../../../../constants/color_constants.dart';
import '../../../../utils/helper_functions.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key, required this.isLoading});

  final bool isLoading;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  void _onForgotPasswordTap() {
    HelperFunctions.showSnackBar('Navigating to Forgot Password...');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ForgetPasswordScreen(isLoading: widget.isLoading),
      ),
    );
  }

  void _onSignInTap() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      context.read<AuthBloc>().add(AuthSignInRequested(email, password));
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
            _buildSignInButton(),
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
        child: const Text('Forgot Password?'),
      ),
    );
  }

  Widget _buildSignInButton() {
    return CustomButton(
      onTap: _onSignInTap,
      child: widget.isLoading
          ? CircularProgressIndicator(color: white,)
          : Text(
              signIn,
              style: TextThemes(
                context,
              ).labelLarge.copyWith(fontWeight: TextWeights.w900, color: white),
            ),
    );
  }
}
