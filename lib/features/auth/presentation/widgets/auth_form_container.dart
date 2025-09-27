import 'package:flutter/material.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:problem_spark/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:problem_spark/features/auth/presentation/widgets/toggle_button.dart';
import 'package:problem_spark/utils/helper_functions.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/string_constants.dart';

class AuthFormContainer extends StatefulWidget {
  const AuthFormContainer({super.key});

  @override
  State<AuthFormContainer> createState() => _AuthFormContainerState();
}

class _AuthFormContainerState extends State<AuthFormContainer> {
  bool _isSignInSelected = true;

  void _toggleButtonSelected() {
    setState(() {
      _isSignInSelected = !_isSignInSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = HelperFunctions.getScreenWidth(context);
    final height = HelperFunctions.getScreenWidth(context);
    return Container(
      padding: const EdgeInsets.all(10),
      height: height * 1.2,
      width: width,
      decoration: BoxDecoration(
        borderRadius: CustomRadius.textFieldRadius,
        border: Border.all(color: grey, width: 0.4)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildGetStartedMessage(),
            SizedBox(height: height * 0.01),
            _buildAccountCreationMessage(),
            SizedBox(height: height * 0.02),
            _buildToggleButton(),
            SizedBox(height: height * 0.05),
            _isSignInSelected ? SignInForm() : SignUpForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildGetStartedMessage() {
    return Text(
      getStartedMessage,
      style: TextThemes(context).headlineSmall.copyWith(
        letterSpacing: 1.4,
      ),
    );
  }

  Widget _buildAccountCreationMessage() {
    return Text(
      accountCreationMessage,
      style: TextThemes(context).labelMedium.copyWith(
        fontWeight: TextWeights.w900,
        letterSpacing: 1.4,
        color: grey,
      ),
    );
  }

  Widget _buildToggleButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: lightGrey,
      ),
      child: Row(
        children: [
          Expanded(
            child: ToggleButton(
              label: signIn,
              onTap: _toggleButtonSelected,
              isSelected: _isSignInSelected ? true : false,
            ),
          ),
          Expanded(
            child: ToggleButton(
              label: signUp,
              onTap: _toggleButtonSelected,
              isSelected: _isSignInSelected ? false : true,
            ),
          ),
        ],
      ),
    );
  }
}
