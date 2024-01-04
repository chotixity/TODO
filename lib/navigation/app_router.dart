import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/bottombar.dart';
import '../provider/appstatemanager.dart';


class AppRouter {
  final AppStateManager appStateManager;
  AppRouter(this.appStateManager);
  late final router = GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: appStateManager,
    initialLocation: '/home',
    routes: [
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) {
          final tab = int.tryParse(state.pathParameters['tab'] ?? '') ?? 0;
          return BottomBar(
            key: state.pageKey,
            currentTab: tab,
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
  );
}
