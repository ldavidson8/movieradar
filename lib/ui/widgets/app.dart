import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/blocs/theme_cubit.dart';
import 'package:movieradar/themes.dart';
import 'package:movieradar/ui/screens/error.dart';

import 'package:movieradar/ui/screens/Home/home.dart';
import 'package:movieradar/ui/screens/search.dart';
import 'package:movieradar/ui/screens/favourites.dart';
import 'package:movieradar/ui/screens/Settings/settings.dart';
import 'package:movieradar/ui/screens/login.dart';
import 'package:movieradar/ui/screens/movie_page.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            const MaterialPage(
              child: Home(),
            )),
    GoRoute(
      path: '/search',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const MaterialPage(child: Search()),
    ),
    GoRoute(
      path: '/favourites',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const MaterialPage(child: Favourites()),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const MaterialPage(child: Settings()),
    ),
    GoRoute(
      path: '/movie/:id',
      name: 'moviedetails',
      pageBuilder: (BuildContext context, GoRouterState state) {
        final id = state.pathParameters['id'];
        if (id != null && int.tryParse(id) != null) {
          return MaterialPage(child: MoviePage(id: int.parse(id)));
        } else {
          // Handle the case where the ID is not valid.
          return MaterialPage(child: ErrorScreen());
        }
      },
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (BuildContext context, GoRouterState state) =>
          MaterialPage(child: LoginScreen()),
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
