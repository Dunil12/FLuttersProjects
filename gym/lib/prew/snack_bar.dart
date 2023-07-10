import 'package:flutter/material.dart';

class Snackbar {
  static const Color redColor = Colors.red;
  static const Color greenColor = Colors.green;

  static Future<void> showSnackbar (
      BuildContext context, String message, bool error) async {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    Color backgroundColor = error ? redColor : greenColor;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
