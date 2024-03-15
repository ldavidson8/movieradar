import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movieradar/blocs/login/login_bloc.dart';
import 'package:movieradar/blocs/moviegenres/movie_genres_cubit.dart';
import 'package:movieradar/blocs/nowplayingmovie/now_playing_movies_cubit.dart';
import 'package:movieradar/blocs/popularmovie/popular_movie_cubit.dart';
import 'package:movieradar/blocs/topmovie/top_movies_cubit.dart';
import 'package:movieradar/blocs/trendingmovie/trendingmovie_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:movieradar/blocs/bottom_navigation_bloc.dart';
import 'package:movieradar/blocs/theme_cubit.dart';
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
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) =>
              NowPlayingMoviesCubit()..getNowPlayingMovies(context),
        ),
        BlocProvider(
          create: (context) => TrendingMovieCubit()..getTrendingMovies(context),
        ),
        BlocProvider(
          create: (context) => PopularMovieCubit()..getPopularMovies(context),
        ),
        BlocProvider(
          create: (context) => TopMoviesCubit()..getTopMovies(context),
        ),
        BlocProvider(
          create: (context) => MovieGenresCubit()..getMovieGenres(context),
        )
      ],
      child: const MovieRadarApp(),
    ),
  );
}
