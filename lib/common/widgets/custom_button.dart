import 'package:flutter/material.dart';
import 'package:problem_spark/utils/helper_functions.dart';

import '../../constants/color_constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.child, this.backgroundColor});

  final void Function() onTap;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: HelperFunctions.getScreenWidth(context),
      height: HelperFunctions.getScreenHeight(context) * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? black,
          elevation: 0
        ),
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
