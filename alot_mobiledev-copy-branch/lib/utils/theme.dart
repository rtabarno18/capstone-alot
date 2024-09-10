import 'package:flutter/material.dart';
import 'constants.dart'; // Import the constants

final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  hintColor: secondaryColor80LightTheme,
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: textColorLightTheme),
    bodyMedium: TextStyle(color: textColorLightTheme),
    displayLarge: TextStyle(
        color: textColorLightTheme, fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        color: textColorLightTheme, fontSize: 24, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        color: textColorLightTheme, fontSize: 20, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        color: textColorLightTheme, fontSize: 18, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(
        color: textColorLightTheme, fontSize: 16, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
        color: textColorLightTheme, fontSize: 14, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: textColorLightTheme, fontSize: 16),
    titleSmall: TextStyle(color: textColorLightTheme, fontSize: 14),
    bodySmall: TextStyle(color: textColorLightTheme, fontSize: 12),
    labelLarge: TextStyle(
        color: textColorLightTheme, fontSize: 14, fontWeight: FontWeight.bold),
    labelSmall: TextStyle(color: textColorLightTheme, fontSize: 10),
  ),
  appBarTheme: const AppBarTheme(
    color: primaryColor,
    titleTextStyle: TextStyle(
        color: textColorLightTheme, fontSize: 20, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: textColorLightTheme),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: primaryColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: secondaryColor60LightTheme),
    ),
    labelStyle: TextStyle(color: primaryColor),
    hintStyle: TextStyle(color: secondaryColor40LightTheme),
  ),
);
