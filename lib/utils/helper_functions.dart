import 'package:flutter/material.dart';
import 'package:problem_spark/main.dart';

class HelperFunctions {
  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static void showSnackBar(String? message) {
    if (message == null || message.isEmpty) return;

    final snackBar = SnackBar(content: Text(message));

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

}
