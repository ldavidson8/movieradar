import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';
import 'package:movieradar/ui/widgets/movie_card.dart';
import 'package:movieradar/ui/widgets/search_input.dart';
import 'package:movieradar/blocs/searchmovie/search_movie_cubit.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchMovieCubit(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Search'),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
                builder: (context, state) {
                  return SearchInput(
                    placeholder: 'Looking for something to watch?',
                    onChanged: (value) {
                      context
                          .read<SearchMovieCubit>()
                          .onSearchQueryChanged(value);
                    },
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchMovieCubit, SearchMovieState>(
                builder: (context, state) {
                  if (state is SearchMovieLoading) {
                    return Center(
                        child: Transform.scale(
                            scale: 1, child: CircularProgressIndicator()));
                  } else if (state is SearchMovieLoaded) {
                    return ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return MovieCard(
                          id: movie.id ?? 0,
                          posterPath: movie.posterPath ?? '',
                          title: movie.title,
                        );
                      },
                    );
                  } else if (state is SearchMovieError) {
                    return Text('Error: ${state.message}');
                  } else {
                    return Text('Search results will be shown here');
                  }
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: AppBottomNavigation(),
      ),
    );
  }
}
