import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movieradar/themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitial()) {
    on<ChangeThemeEvent>((event, emit) {
      emit(ThemeChanged(themeIndex: event.themeIndex));
    });
  }

  static const int defaultThemeIndex = 0;

  final List<ThemeData> _themes = [
    AppTheme.lightTheme,
    AppTheme.darkTheme,
    AppTheme.amoledTheme,
  ];

  ThemeData get currentTheme {
    if (state is ThemeChanged) {
      return _themes[state.themeIndex];
    } else {
      return _themes[defaultThemeIndex];
    }
  }
}
