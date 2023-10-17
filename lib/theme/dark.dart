import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey,
    secondary: Colors.grey[800]!,
  ),
  textTheme: const TextTheme(
    displayMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 12,
      color: Colors.white54,
    ),
  ),
);