part of 'theme_bloc.dart';

sealed class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];

  get themeIndex => null;
}

final class ThemeInitial extends ThemeState {}

final class ThemeChanged extends ThemeState {
  const ThemeChanged({required this.themeIndex});

  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}
