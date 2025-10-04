import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/common/widgets/custom_button.dart';
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

  void _onStartDiscoveryTap() {}

  void _onViewLibraryTap() {}

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
              _buildBuyCreditButton(),
              SizedBox(height: screenHeight * 0.03),
              _buildProblemDiscoveryComponent(),
              SizedBox(height: screenHeight * 0.03),
              _buildMyProblemLibraryComponent(),
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
          children: [
            Icon(Icons.add),
            Text(
              buyCreditsButtonLabel,
              style: TextThemes(
                context,
              ).labelLarge.copyWith(fontWeight: TextWeights.w900),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProblemDiscoveryComponent() {
    return _buildContainerComponent(_onStartDiscoveryTap, true);
  }

  Widget _buildMyProblemLibraryComponent() {
    return _buildContainerComponent(_onViewLibraryTap, false);
  }

  Widget _buildContainerComponent(
    void Function() onTap,
    bool isProblemDiscoveryComponent,
  ) {
    Color containerColor = isProblemDiscoveryComponent ? babyBlue : babyPurple;
    Color containerBorderColor = isProblemDiscoveryComponent ? lightBlue : lightPurple;
    String heading = isProblemDiscoveryComponent
        ? problemDiscoveryHeading
        : myProblemLibraryHeading;
    String description = isProblemDiscoveryComponent
        ? problemDiscoveryDescription
        : myProblemLibraryDescription;
    Color buttonTextColor = isProblemDiscoveryComponent ? white : black;
    Color buttonColor = isProblemDiscoveryComponent ? blue : white;
    String buttonLabel = isProblemDiscoveryComponent
        ? problemDiscoveryButtonLabel
        : myProblemLibraryButtonLabel;

    IconData buttonIcon = isProblemDiscoveryComponent ? Icons.star_border : Icons.tune;

    return Container(
      padding: Paddings.componentPadding,
      width: HelperFunctions.getScreenWidth(context),
      decoration: BoxDecoration(
        borderRadius: CustomRadius.containerRadius,
        border: Border.all(
          color: containerBorderColor
        ),
        color: containerColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextThemes(context).titleLarge.copyWith(
              fontWeight: TextWeights.w900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextThemes(
              context,
            ).bodyMedium.copyWith(fontWeight: TextWeights.w900, color: grey),
          ),
          SizedBox(height: 10),
          CustomButton(
            backgroundColor: buttonColor,
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(buttonIcon,  fontWeight: FontWeight.w900, color: buttonTextColor, ),
                Text(buttonLabel, style: TextThemes(context).bodyLarge.copyWith(
                  fontWeight: TextWeights.w900,
                  color: buttonTextColor
                ),),
                Icon(Icons.arrow_forward_rounded, fontWeight: FontWeight.w900, color: buttonTextColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
