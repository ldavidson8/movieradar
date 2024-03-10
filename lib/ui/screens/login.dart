import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInAsGuest(BuildContext context) async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();
      context.go('/home');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error logging in: ${e.message!}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('Login'),
            ElevatedButton(
              onPressed: () => _signInAsGuest(context),
              child: Text('Sign in as guest'),
            ),
          ],
        ),
      ),
    );
  }
}
