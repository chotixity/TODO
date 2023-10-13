import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: Colors.white24,
    secondary: Colors.grey,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 12,
      //overflow: TextOverflow.ellipsis,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
);
