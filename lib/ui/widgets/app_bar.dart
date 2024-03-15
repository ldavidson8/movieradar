import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/blocs/login/login_bloc.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String title;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final Widget avatarCircle = const CircleAvatar(
    radius: 20.0,
    backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is NotLoggedIn) {
          context.go('/login');
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          final isLoggedIn = state is LoggedIn;
          return AppBar(
            title: Text(widget.title),
            actions: [
              if (!isLoggedIn)
                IconButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  icon: const Icon(Icons.login),
                ),
              PopupMenuButton(
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
                      if (isLoggedIn) {
                        context.read().add(Logout());
                      } else {
                        context.go('/login');
                      }
                      break;
                    default:
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
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
                    child:
                        isLoggedIn ? const Text('Logout') : const Text('Login'),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
