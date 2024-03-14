import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieradar/blocs/cubit/movie_credit_cubit.dart';
import 'package:movieradar/blocs/moviedetail/movie_detail_cubit.dart';
import 'package:movieradar/models/genre.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';
import 'package:movieradar/ui/widgets/cast_member_card.dart';
import 'package:movieradar/ui/widgets/movie_detail_poster.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.id});
  final int id;

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  void initState() {
    super.initState();
  }

  Widget _buildGenreWidget(List<Genre> genres) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: genres.map((genre) {
        return Chip(
          label: Text(genre.name!),
          // Add any other properties you want
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieDetailCubit>(
          create: (context) => MovieDetailCubit()..getMovieDetails(widget.id),
        ),
        BlocProvider<MovieCreditCubit>(
          create: (context) => MovieCreditCubit()..getMovieCredits(widget.id),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
            builder: (context, state) {
              if (state is MovieDetailLoading) {
                return CircularProgressIndicator();
              } else if (state is MovieDetailLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      MovieDetailPoster(movie: state.movie),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    state.movie.title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              state.movie.releaseDate!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            _buildGenreWidget(state.movie.genres!),
                            SizedBox(height: 10),
                            Text(
                              state.movie.overview!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Cast',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                            ),
                            SizedBox(height: 16),
                            BlocBuilder<MovieCreditCubit, MovieCreditState>(
                              builder: (context, state) {
                                if (state is MovieCreditLoading) {
                                  return CircularProgressIndicator();
                                } else if (state is MovieCreditLoaded) {
                                  final cast = state.movieCast.cast;

                                  return GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 0.5,
                                      mainAxisSpacing: 8,
                                      crossAxisSpacing: 8,
                                    ),
                                    itemCount: cast!.length,
                                    itemBuilder: (context, index) {
                                      final castMember = cast[index];
                                      return CastMemberCard(
                                        name: castMember.name ?? 'Unknown',
                                        profilePath: castMember.profilePath!,
                                        character: castMember.character,
                                      );
                                    },
                                  );
                                } else {
                                  return Text('Error loading movie credits');
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
                // Display other movie details here
              } else {
                return Text('Error loading movie details');
              }
            },
          ),
        ),
        bottomNavigationBar: AppBottomNavigation(),
      ),
    );
  }
}
