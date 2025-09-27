import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/constants/color_constants.dart';
import 'package:problem_spark/constants/string_constants.dart';
import 'package:problem_spark/features/splash/presentation/widgets/app_logo.dart';
import 'package:problem_spark/main.dart';
import 'package:problem_spark/utils/helper_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      navigatorKey.currentState!.pushReplacementNamed('/signUp');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    final screenHeight = HelperFunctions.getScreenHeight(context);
    return Padding(
      padding: Paddings.screenPadding,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(
              width: HelperFunctions.getScreenWidth(context) * 0.22,
              height: HelperFunctions.getScreenHeight(context) * 0.11,
            ).animate().rotate(duration: Duration(milliseconds: 800)),
            SizedBox(height: screenHeight * 0.04),
            _buildAppTitle(),
            SizedBox(height: screenHeight * 0.01),
            _buildAppDescription(),
            SizedBox(height: screenHeight * 0.04),
            _buildProgressIndicator(),
            SizedBox(height: screenHeight * 0.02),
            _buildProgressLabelText(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppTitle() {
    return Text(
      appName,
      style: TextThemes(context).headlineLarge.copyWith(
        fontWeight: TextWeights.w900,
        letterSpacing: 1.4,
      ),
    ).animate().slideY(duration: Duration(milliseconds: 900), begin: 1, end: 0).fade();
  }

  Widget _buildAppDescription() {
    return Text(
      appDescription,
      style: TextThemes(context).bodyLarge.copyWith(
        fontWeight: TextWeights.w900,
        letterSpacing: 1.4,
        color: grey,
      ),
    ).animate().slideY(duration: Duration(milliseconds: 900), begin: 10, end: 0).fade();
  }

  Widget _buildProgressIndicator() {
    return SizedBox(
      width: HelperFunctions.getScreenWidth(context) * 0.7,
      child: LinearProgressIndicator(
        color: black,
        backgroundColor: grey,
        value: 1,
      ),
    );
  }

  Widget _buildProgressLabelText() {
    return Text(
      loadingText,
      style: TextThemes(context).labelSmall.copyWith(
        fontWeight: TextWeights.w900,
        letterSpacing: 1.4,
        color: grey,
      ),
    ).animate().slideY(duration: Duration(milliseconds: 900), begin: 10, end: 0).fade();
  }

}
