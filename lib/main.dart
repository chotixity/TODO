import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/tasks.dart';

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
      providers: [ChangeNotifierProvider<Tasks>(create: (_) => Tasks())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
              displayMedium:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              titleLarge:
                  GoogleFonts.oswald(fontSize: 18, fontWeight: FontWeight.w700),
              bodyMedium: GoogleFonts.lato(),
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
        darkTheme: darkTheme,
        home: const BottomBar(),
      ),
    );
  }
}
