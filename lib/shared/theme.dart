import 'package:flutter/material.dart';

const Color bluishColor = Color(0xFF4E5AE8);
const Color yellowColor = Color(0xFFFFB746);
const Color pinkColor = Color(0xFFFF4667);
const Color whiteColor = Colors.white;
const Color darkGreyColor = Color(0xFF121212);
const Color darkHeaderColor = Color(0xFF424242);

const primaryColor = bluishColor;

class ThemeConfig {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    // *NOTE: this for change the primary color for this flutter SDK version
    colorScheme: const ColorScheme.light().copyWith(primary: primaryColor),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    // *NOTE: this for change the primary color for this flutter SDK version
    colorScheme: const ColorScheme.dark().copyWith(primary: darkGreyColor),
  );
}
