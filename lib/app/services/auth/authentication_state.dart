import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proheal/app/pages/core/dashboard.dart';
import 'package:proheal/app/pages/landing/landing_page.dart';

class AuthState extends StatelessWidget {
  const AuthState({Key? key}) : super(key: key);

  // stream that listens to user state (sign in or out)
  @override
  Widget build(BuildContext context) {
    Stream<User?> userChanges = FirebaseAuth.instance.authStateChanges();
    return StreamBuilder<User?>(
      stream: userChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Dashboard();
        }
        return const LandingPage();
      },
    );
  }
}
