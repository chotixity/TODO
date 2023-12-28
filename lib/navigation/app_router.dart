import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/bottombar.dart';

import '../screens/screens.dart';

class AppRouter {
  late final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) {
          final tab = int.tryParse(state.pathParameters['tab'] ?? '') ?? 0;
          return BottomBar(tab);
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
