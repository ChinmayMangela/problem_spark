import 'package:flutter/material.dart';
import 'package:problem_spark/common/dimen.dart';
import 'package:problem_spark/constants/color_constants.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(borderRadius: CustomRadius.logoRadius, color: black,),
      child: Icon(Icons.lightbulb_outlined, color: white, size: 50,),
    );
  }
}
