import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    primary: Colors.white24,
    secondary: Colors.grey,
  ),
  textTheme: TextTheme(
    displayMedium: const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      color: Colors.grey[300]!,
      fontSize: 12,
      //overflow: TextOverflow.ellipsis,
    ),
    bodyLarge: const TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
);
