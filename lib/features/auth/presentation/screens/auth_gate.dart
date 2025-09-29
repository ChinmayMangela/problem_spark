import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:problem_spark/features/auth/presentation/screens/auth_screen.dart';
import 'package:problem_spark/home_screen.dart';
import 'package:problem_spark/tabs.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }

      if(snapshot.hasData) {
        return const Tabs();
      } else {
        return const AuthScreen();
      }
    });
  }
}