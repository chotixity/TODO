import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    background: Colors.white70,
    primary: Colors.grey[100]!,
    secondary: Colors.white,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      color: Colors.grey,
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
