import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:problem_spark/common/dimen.dart';

import '../constants/color_constants.dart';

class AppTheme {
  static ThemeData get appTheme => ThemeData(
    scaffoldBackgroundColor: white,
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme(),
    textButtonTheme: _textButtonTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
    appBarTheme: _appBarTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    iconTheme: _iconTheme,
  );

  static TextButtonThemeData get _textButtonTheme =>
      TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: black));

  static ElevatedButtonThemeData get _elevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: black,
          foregroundColor: white,
          textStyle: GoogleFonts.lato(color: white),
          shape: RoundedRectangleBorder(
            borderRadius: CustomRadius.textFieldRadius,
          ),
        ),
      );

  static AppBarTheme get _appBarTheme =>
      AppBarTheme(backgroundColor: Colors.transparent);

  static OutlinedButtonThemeData get _outlinedButtonTheme =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: CustomRadius.outlinedButtonRadius
          ),
          foregroundColor: black
        ),
      );


  static IconThemeData get _iconTheme => IconThemeData(
    size: 20,
    weight: 100,
  ) ;

}
