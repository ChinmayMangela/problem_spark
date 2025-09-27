

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
  final BuildContext context;

  TextWeights(this.context);

  FontWeight get w900 => FontWeight.w900;
  FontWeight get w800 => FontWeight.w800;
  FontWeight get w700 => FontWeight.w700;
  FontWeight get w600 => FontWeight.w600;
  FontWeight get w500 => FontWeight.w500;
  FontWeight get w400 => FontWeight.w400;
  FontWeight get w300 => FontWeight.w300;
  FontWeight get w200 => FontWeight.w200;
  FontWeight get w100 => FontWeight.w100;
  FontWeight get bold => FontWeight.bold;
  FontWeight get normal => FontWeight.normal;
}

class Paddings {

  static EdgeInsets get screenPadding => EdgeInsets.all(16);
}

class CustomRadius {
  static BorderRadius get logoRadius => BorderRadius.circular(16);
}