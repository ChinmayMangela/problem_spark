import 'package:flutter/material.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/constants/color_constants.dart';
import 'package:problem_spark/constants/string_constants.dart';
import 'package:problem_spark/features/splash/presentation/widgets/app_logo.dart';

import '../../../../utils/helper_functions.dart';
import '../widgets/auth_form_container.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    final screenHeight = HelperFunctions.getScreenHeight(context);
    return Padding(
      padding: Paddings.screenPadding,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppLogo(
                width: HelperFunctions.getScreenWidth(context) * 0.18,
                height: HelperFunctions.getScreenHeight(context) * 0.1,
              ),
              SizedBox(height: screenHeight * 0.03),
              _buildHeading(context),
              SizedBox(height: screenHeight * 0.01),
              _buildDescription(context),
              SizedBox(height: screenHeight * 0.03),
              AuthFormContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    return Text(
      authScreenTitle,
      style: TextThemes(
        context,
      ).headlineMedium.copyWith(fontWeight: TextWeights.w900),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      authScreenDescription,
      style: TextThemes(
        context,
      ).bodySmall.copyWith(color: grey, fontWeight: TextWeights.bold),
    );
  }
}
