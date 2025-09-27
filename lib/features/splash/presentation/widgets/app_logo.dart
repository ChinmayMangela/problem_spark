import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/constants/color_constants.dart';
import 'package:problem_spark/utils/helper_functions.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HelperFunctions.getScreenWidth(context) * 0.22,
      height: HelperFunctions.getScreenHeight(context) * 0.11,
      decoration: BoxDecoration(borderRadius: CustomRadius.logoRadius, color: black,),
      child: Icon(Icons.lightbulb_outlined, color: white, size: 50,),
    ).animate().rotate(duration: Duration(milliseconds: 800));
  }
}
