

import 'package:flutter/material.dart';

class TextThemes {

  final BuildContext context;
  TextThemes(this.context);


  TextStyle get bodySmall => Theme.of(context).textTheme.bodySmall!;
  TextStyle get bodyMedium => Theme.of(context).textTheme.bodyMedium!;
  TextStyle get bodyLarge => Theme.of(context).textTheme.bodyLarge!;

  TextStyle get headlineSmall => Theme.of(context).textTheme.headlineSmall!;
  TextStyle get headlineMedium => Theme.of(context).textTheme.headlineMedium!;
  TextStyle get headlineLarge => Theme.of(context).textTheme.headlineLarge!;

  TextStyle get labelSmall => Theme.of(context).textTheme.labelSmall!;
  TextStyle get labelMedium => Theme.of(context).textTheme.labelMedium!;
  TextStyle get labelLarge => Theme.of(context).textTheme.labelLarge!;

  TextStyle get displaySmall => Theme.of(context).textTheme.displaySmall!;
  TextStyle get displayMedium => Theme.of(context).textTheme.displayMedium!;
  TextStyle get displayLarge => Theme.of(context).textTheme.displayLarge!;

  TextStyle get titleSmall => Theme.of(context).textTheme.titleSmall!;
  TextStyle get titleMedium => Theme.of(context).textTheme.titleMedium!;
  TextStyle get titleLarge => Theme.of(context).textTheme.titleLarge!;


}


class TextWeights {

  static FontWeight get w900 => FontWeight.w900;
  static FontWeight get w800 => FontWeight.w800;
  static FontWeight get w700 => FontWeight.w700;
  static FontWeight get w600 => FontWeight.w600;
  static FontWeight get w500 => FontWeight.w500;
  static FontWeight get w400 => FontWeight.w400;
  static FontWeight get w300 => FontWeight.w300;
  static FontWeight get w200 => FontWeight.w200;
  static FontWeight get w100 => FontWeight.w100;
  static FontWeight get bold => FontWeight.bold;
  static FontWeight get normal => FontWeight.normal;
}

class Paddings {

  static EdgeInsets get screenPadding => EdgeInsets.all(16);
  static EdgeInsets get componentPadding => EdgeInsets.all(30);
}

class CustomRadius {
  static BorderRadius get logoRadius => BorderRadius.circular(16);
  static BorderRadius get textFieldRadius => BorderRadius.circular(16);
  static BorderRadius get outlinedButtonRadius => BorderRadius.circular(10);
  static BorderRadius get containerRadius => BorderRadius.circular(20);
}