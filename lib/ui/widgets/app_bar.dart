import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final Widget avatarCircle = const CircleAvatar(
    radius: 20.0,
    backgroundImage: AssetImage('assets/images/avatar.png'),
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MenuAnchor(
              menuChildren: <Widget>[
                MenuItemButton(child: avatarCircle),
              ],
            ),
            SizedBox(height: 5.0),
            MenuItemButton(
              child: const Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  ),
                  Icon(Icons.settings),
                  Text("Settings"),
                ],
              ),
              onPressed: () => {},
            ),
            MenuItemButton(
              child: const Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  ),
                  Icon(Icons.person),
                  Text("Profile"),
                ],
              ),
              onPressed: () => {},
            ),
            MenuItemButton(
              child: const Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  ),
                  Text("Logout"),
                  Icon(Icons.logout),
                ],
              ),
              onPressed: () => {},
            ),
          ],
        ),
      ],
    );
  }
}
