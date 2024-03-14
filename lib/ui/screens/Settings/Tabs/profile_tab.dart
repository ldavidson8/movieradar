import 'package:flutter/material.dart';
import 'package:movieradar/ui/widgets/input_card.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  ProfileTabState createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 48),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: <Widget>[
                InputCard(
                  title: 'Avatar',
                  subtitle:
                      'This is your avatar. \n Tap on the avatar to upload a custom one.',
                  hintText: '',
                  statusText: 'Tap to upload',
                  bottomContainerColor: Colors.black,
                  hasInput: false,
                  trailing: CircleAvatar(
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                  ),
                ),
                InputCard(
                  title: 'Display Name',
                  subtitle:
                      'Please enter your full name, or a display name you are comfortable with.',
                  hintText: '',
                  statusText: 'Please use 32 characters at maximum',
                  bottomContainerColor: Colors.black,
                ),
                InputCard(
                  title: 'Email',
                  subtitle:
                      'Please enter the email address you want to use to log in.',
                  hintText: '',
                  statusText: 'We will email you to verify the change.',
                  bottomContainerColor: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
