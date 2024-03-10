import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/blocs/authentication/authentication_bloc.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final Widget avatarCircle = const CircleAvatar(
    radius: 20.0,
    backgroundImage: AssetImage('assets/images/avatar.png'),
  );

  final List<PopupMenuEntry<String>> _menuItems = [
    const PopupMenuItem(
      value: '1',
      child: Text('Profile'),
    ),
    const PopupMenuItem(
      value: '2',
      child: Text('Settings'),
    ),
    PopupMenuItem(
      value: '3',
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return Text('Logout');
          } else {
            return Text('Login');
          }
        },
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        PopupMenuButton<String>(
            icon: avatarCircle,
            onSelected: (String value) {
              switch (value) {
                case '1':
                  context.go('/profile');
                  break;
                case '2':
                  context.go('/settings');
                  break;
                case '3':
                  context.go('/login');
                  break;
                default:
                  break;
              }
            },
            itemBuilder: (BuildContext context) => _menuItems),
      ],
    );
  }
}
