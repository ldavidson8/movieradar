import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movieradar/blocs/authentication/authentication_bloc.dart';
import 'package:movieradar/blocs/nowplayingmovie/now_playing_movies_cubit.dart';
import 'package:movieradar/blocs/popularmovie/popular_movie_cubit.dart';
import 'package:movieradar/blocs/trendingmovie/trendingmovies_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:movieradar/blocs/bottom_navigation_bloc.dart';
import 'package:movieradar/cubits/theme_cubit.dart';
import 'package:movieradar/ui/widgets/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => NowPlayingMoviesCubit()..getNowPlayingMovies(),
        ),
        BlocProvider(
          create: (context) => TrendingMovieCubit()..getTrendingMovies(),
        ),
        BlocProvider(
          create: (context) => PopularMovieCubit()..getPopularMovies(),
        ),
      ],
      child: const MovieRadarApp(),
    ),
  );
}
