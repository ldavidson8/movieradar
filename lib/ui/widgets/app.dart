import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:movieradar/themes.dart';

import '../screens/home.dart';
import '../screens/search.dart';
import '../screens/favourites.dart';
import '../screens/settings.dart';
import '../screens/movie_page.dart';

GoRoute transitionGoRoute({
  required String path,
  required Widget Function(BuildContext, GoRouterState) pageBuilder,
}) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 300),
      child: pageBuilder(context, state),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeIn).animate(animation),
          child: child,
        );
      },
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    transitionGoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) => const Home(),
    ),
    transitionGoRoute(
      path: '/search',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const Search(),
    ),
    transitionGoRoute(
      path: '/favourites',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const Favourites(),
    ),
    transitionGoRoute(
      path: '/settings',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const Settings(),
    ),
    transitionGoRoute(
      path: '/movie:id',
      pageBuilder: (BuildContext context, GoRouterState state) {
        final String id = state.pathParameters['id']!;
        return MoviePage(id: id);
      },
    ),
  ],
);

class MovieRadarApp extends StatelessWidget {
  const MovieRadarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'movieradar',
      theme: AppTheme.lightTheme,
      routerConfig: _router,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
