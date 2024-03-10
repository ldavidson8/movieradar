import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/blocs/bottom_navigation_bloc.dart';

class AppBottomNavigation extends StatefulWidget {
  const AppBottomNavigation({super.key});

  @override
  AppBottomNavigationState createState() => AppBottomNavigationState();
}

class AppBottomNavigationState extends State<AppBottomNavigation> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outline),
      label: 'Favourites',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, int>(
      builder: (context, currentindex) {
        return BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (index) {
            switch (index) {
              case 0:
                context
                    .read<BottomNavigationBloc>()
                    .add(BottomNavigationEvent.homeTapped);
                context.go('/');
                break;
              case 1:
                context
                    .read<BottomNavigationBloc>()
                    .add(BottomNavigationEvent.searchTapped);
                context.go('/search');
                break;
              case 2:
                context
                    .read<BottomNavigationBloc>()
                    .add(BottomNavigationEvent.favouritesTapped);
                context.go('/favourites');
                break;
              case 3:
                context
                    .read<BottomNavigationBloc>()
                    .add(BottomNavigationEvent.settingsTapped);
                context.go('/settings');
                break;
            }
          },
          items: bottomNavItems,
        );
      },
    );
  }
}
