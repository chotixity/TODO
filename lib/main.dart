import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './theme/dark.dart';
import './widgets/bottombar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: darkTheme,
        darkTheme: darkTheme,
        home: const BottomBar(),
      ),
    );
  }
}
