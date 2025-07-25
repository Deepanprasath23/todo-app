import 'package:flutter/material.dart';

class Constants {
  static const double padding = 16.0;
  static const double radius = 12.0;

  static OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: const BorderSide(color: Colors.indigo),
  );
}
