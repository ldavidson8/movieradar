import 'package:flutter/material.dart';
import 'package:movieradar/ui/screens/Home/Tabs/movies_tab.dart';
import 'package:movieradar/ui/screens/Home/Tabs/new_trending_tab.dart';
import 'package:movieradar/ui/screens/Home/Tabs/tv_series_tab.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(title: 'Movies'),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Movies'),
                Tab(text: 'Series'),
                Tab(text: 'New & Trending'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MoviesTab(),
                  TvSeriesTab(),
                  NewTrendingTab(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: const AppBottomNavigation(),
      ),
    );
  }
}
