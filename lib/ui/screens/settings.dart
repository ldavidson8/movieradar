import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings'),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: AppBottomNavigation(),
    );
  }
}
