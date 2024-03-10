import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Movie Page $id'),
      body: const SafeArea(
        child: Text('Movie Page'),
      ),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }
}
