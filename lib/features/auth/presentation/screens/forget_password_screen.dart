import 'package:flutter/material.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:problem_spark/utils/helper_functions.dart';

import '../../../../common/widgets/custom_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;

  void _onForgotPasswordTap() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthTextField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  isPasswordField: false,
                  validator: (value) {
                    return HelperFunctions.emailValidator(value);
                  },
                ),
                SizedBox(height: 20),
                CustomButton(label: 'Send', onTap: _onForgotPasswordTap),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
