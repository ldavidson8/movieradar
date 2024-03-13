import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/cubits/theme_cubit.dart';
import 'package:movieradar/themes.dart';

import 'package:movieradar/ui/screens/home.dart';
import 'package:movieradar/ui/screens/search.dart';
import 'package:movieradar/ui/screens/favourites.dart';
import 'package:movieradar/ui/screens/settings.dart';
import 'package:movieradar/ui/screens/login.dart';
import 'package:movieradar/ui/screens/movie_page.dart';

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
    transitionGoRoute(
      path: '/login',
      pageBuilder: (BuildContext context, GoRouterState state) => LoginScreen(),
    ),
  ],
);

class MovieRadarApp extends StatelessWidget {
  const MovieRadarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, ThemeMode mode) {
        return MaterialApp.router(
          title: 'MovieRadar',
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
          themeMode: mode,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
        );
      },
    );
  }
}
