import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/HomeTabs/movies_tab.dart';
import 'package:movieradar/ui/widgets/HomeTabs/new_trending_tab.dart';
import 'package:movieradar/ui/widgets/HomeTabs/tv_series_tab.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Movies'),
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                tabs: const [
                  Tab(text: 'Movies'),
                  Tab(text: 'Series'),
                  Tab(text: 'New & Trending'),
                ],
              ),
              Expanded(
                  child: TabBarView(children: [
                MoviesTab(),
                TvSeriesTab(),
                NewTrendingTab(),
              ])),
            ],
          ),
        ),
        bottomNavigationBar: const AppBottomNavigation(),
      ),
    );
  }
}
