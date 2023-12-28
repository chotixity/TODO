import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/navigation/app_router.dart';
import 'package:todo_app/provider/tasks.dart';
import 'theme/appTheme.dart';
import './widgets/bottombar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const TODOApp());
}

class TODOApp extends StatefulWidget {
  const TODOApp({super.key});

  @override
  State<TODOApp> createState() => _TODOAppState();
}

class _TODOAppState extends State<TODOApp> {
  final _approuter = AppRouter().router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Tasks>(create: (_) => Tasks()),
      ],
      child: MaterialApp.router(
        routeInformationParser: _approuter.routeInformationParser,
        routerDelegate: _approuter.routerDelegate,
        routeInformationProvider: _approuter.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        title: 'Focus Bloom',
        theme: ThemeData(),
        //home: const BottomBar(),
      ),
    );
  }
}
