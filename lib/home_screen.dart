import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/common/widgets/custom_outlined_button.dart';
import 'package:problem_spark/constants/color_constants.dart';
import 'package:problem_spark/constants/icon_constants.dart';
import 'package:problem_spark/constants/string_constants.dart';
import 'package:problem_spark/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:problem_spark/features/auth/presentation/bloc/auth_state.dart';
import 'package:problem_spark/utils/helper_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onBuyMoreTap() {}

  @override
  Widget build(BuildContext context) {
    final screenHeight = HelperFunctions.getScreenHeight(context);
    return Scaffold(
      body: Padding(
        padding: Paddings.screenPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeading(),
              SizedBox(height: screenHeight * 0.01),
              _buildSubTitle(),
              SizedBox(height: screenHeight * 0.03),
              _buildAvailableCreditsComponent(),
              SizedBox(height: screenHeight * 0.01),
              _buildBuyCreditButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final userName = state is Authenticated ? state.endUser.name : 'Dummy';
        return Text(
          'Welcome back, $userName!',
          style: TextThemes(
            context,
          ).titleLarge.copyWith(fontWeight: TextWeights.w900),
        );
      },
    );
  }

  Widget _buildSubTitle() {
    return Text(
      homeSubtitle,
      style: TextThemes(context).titleMedium.copyWith(color: grey),
    );
  }

  Widget _buildAvailableCreditsComponent() {
    return Row(
      children: [
        Icon(creditsIcon),
        SizedBox(width: 4),
        Text(
          '25',
          style: TextThemes(
            context,
          ).headlineSmall.copyWith(fontWeight: TextWeights.w900),
        ),
        SizedBox(width: 7),
        Text(
          'Credits',
          style: TextThemes(
            context,
          ).labelLarge.copyWith(fontWeight: TextWeights.w900, color: grey),
        ),
      ],
    );
  }

  Widget _buildBuyCreditButton() {
    return SizedBox(
      width: HelperFunctions.getScreenWidth(context) * 0.33,
      child: CustomOutlinedButton(
        onTap: _onBuyMoreTap,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(Icons.add), Text(buyCreditsButtonLabel)]),
      ),
    );
  }
}
