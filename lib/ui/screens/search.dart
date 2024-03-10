import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Search'),
      body: SafeArea(
        child: Column(),
      ),
      bottomNavigationBar: AppBottomNavigation(),
    );
  }
}
