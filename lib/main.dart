import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/helpers/profilemanager.dart';
import 'package:todo_app/navigation/app_router.dart';
import 'package:todo_app/provider/appstatemanager.dart';
import 'package:todo_app/provider/tasks.dart';
import 'theme/appTheme.dart';
import './widgets/bottombar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appStateManager = AppStateManager();
  await Hive.initFlutter();
  runApp(TODOApp(appStateManager: appStateManager));
}

class TODOApp extends StatefulWidget {
  const TODOApp({super.key, required this.appStateManager});
  final AppStateManager appStateManager;
  @override
  State<TODOApp> createState() => _TODOAppState();
}

class _TODOAppState extends State<TODOApp> {
  late final _approuter = AppRouter(widget.appStateManager).router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Tasks>(create: (_) => Tasks()),
        ChangeNotifierProvider(create: (_) => AppStateManager()),
        ChangeNotifierProvider(create: (_) => ProfileManager()),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.getdarkMode) {
            theme = ToDOTheme.dark();
          } else {
            theme = ToDOTheme.light();
          }
          return MaterialApp.router(
            routeInformationParser: _approuter.routeInformationParser,
            routerDelegate: _approuter.routerDelegate,
            routeInformationProvider: _approuter.routeInformationProvider,
            debugShowCheckedModeBanner: false,
            title: 'Focus Bloom',
            theme: theme,
            //home: const BottomBar(),
          );
        },
      ),
    );
  }
}
