import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: AppBottomNavigation(),
    );
  }
}
