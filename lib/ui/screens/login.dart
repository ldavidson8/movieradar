import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:movieradar/ui/widgets/app_bar.dart';
import 'package:movieradar/ui/widgets/bottom_navigation.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInAsGuest(BuildContext context) async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();
      context.go('/');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error logging in: ${e.message!}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Login'),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () => _signInAsGuest(context),
                child: Text('Sign in as guest'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigation(),
    );
  }
}
