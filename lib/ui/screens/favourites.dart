import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Favourites'),
      body: SafeArea(
        child: Column(),
      ),
      bottomNavigationBar: AppBottomNavigation(),
    );
  }
}
