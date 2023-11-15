import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/tasks.dart';
import './theme/dark.dart';
import './widgets/bottombar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const TODOApp());
}

class TODOApp extends StatelessWidget {
  const TODOApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Tasks>(create: (_) => Tasks()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Focus Bloom',
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
