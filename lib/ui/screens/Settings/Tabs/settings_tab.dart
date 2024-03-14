import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieradar/blocs/theme_cubit.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  final List<(String, ThemeMode)> _themes = const [
    ('Light', ThemeMode.light),
    ('Dark', ThemeMode.dark),
    ('System', ThemeMode.system),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, selectedTheme) {
        return Column(
          children: List.generate(
            _themes.length,
            (index) {
              final String label = _themes[index].$1;
              final ThemeMode theme = _themes[index].$2;
              return ListTile(
                title: Text(label),
                onTap: () => context.read<ThemeCubit>().updateTheme(theme),
                trailing:
                    selectedTheme == theme ? const Icon(Icons.check) : null,
              );
            },
          ),
        );
      },
    );
  }
}
