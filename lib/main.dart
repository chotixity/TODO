import 'package:flutter/material.dart';
import 'package:todo_app/widgets/bottombar.dart';

import './screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.white,
          primary: Colors.white,
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        useMaterial3: true,
      ),
      home: const BottomBar(),
    );
  }
}
