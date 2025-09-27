import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constants.dart';

class AppTheme {
  static ThemeData get appTheme => ThemeData(
    scaffoldBackgroundColor: white,
    brightness: Brightness.light,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
