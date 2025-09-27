import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:problem_spark/utils/helper_functions.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../constants/color_constants.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key, required this.isLoading});

  final bool isLoading;

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;

  void _onForgotPasswordTap() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();

      context.read<AuthBloc>().add(
        AuthForgotPasswordRequested(email),
      );

      FocusScope.of(context).unfocus();
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: Paddings.screenPadding,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                AuthTextField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  isPasswordField: false,
                  validator: (value) {
                    return HelperFunctions.emailValidator(value);
                  },
                ),
                const SizedBox(height: 20),
               _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton() {
    return CustomButton(
      onTap: _onForgotPasswordTap,
      child: widget.isLoading ? CircularProgressIndicator(color: white,) : Text(
        'Send Reset Link',
        style: TextThemes(
          context,
        ).labelLarge.copyWith(fontWeight: TextWeights.w900, color: white),
      ),
    );
  }
}