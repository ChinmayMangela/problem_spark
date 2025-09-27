import 'package:flutter/material.dart';
import 'package:problem_spark/utils/helper_functions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.child});

  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: HelperFunctions.getScreenWidth(context),
      height: HelperFunctions.getScreenHeight(context) * 0.07,
      child: ElevatedButton(
        onPressed: onTap,
        child: child,
      ),
    );
  }
}
