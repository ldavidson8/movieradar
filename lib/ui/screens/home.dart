import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/HomeTabs/movies_tab.dart';
import 'package:movieradar/ui/widgets/HomeTabs/new_trending_tab.dart';
import 'package:movieradar/ui/widgets/HomeTabs/tv_series_tab.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController;
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _tabController = TabController(vsync: this, length: 3)
      ..addListener(() {
        if (_tabController.indexIsChanging) {
          setState(() {
            _animationController.forward(from: 0.0);
          });
        }
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Movies'),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Movies'),
              Tab(text: 'Series'),
              Tab(text: 'New & Trending'),
            ],
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            child: [
              MoviesTab(),
              TvSeriesTab(),
              NewTrendingTab(),
            ][_tabController.index],
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }
}
