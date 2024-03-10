part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  const ChangeThemeEvent({required this.themeIndex});

  final int themeIndex;

  @override
  List<Object> get props => [themeIndex];
}
