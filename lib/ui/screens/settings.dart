import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/SettingsTabs/profile_tab.dart';
import 'package:movieradar/ui/widgets/SettingsTabs/settings_tab.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Settings'),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Profile'),
              Tab(text: 'Settings'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ProfileTab(),
                SettingsTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }
}
