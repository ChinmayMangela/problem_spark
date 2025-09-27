import 'package:flutter/material.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/constants/color_constants.dart';
import 'package:problem_spark/utils/helper_functions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onTap});

  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: HelperFunctions.getScreenWidth(context),
      height: HelperFunctions.getScreenHeight(context) * 0.07,
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          label,
          style: TextThemes(
            context,
          ).labelLarge.copyWith(fontWeight: TextWeights.w900, color:white),
        ),

      ),
    );
  }
}
