import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key, required String id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Text('Movie Page {id}'),
      ),
      bottomNavigationBar: AppBottomNavigation(),
    );
  }
}
