import 'package:flutter/material.dart';
import 'package:oev_v03/authentication/authentication_screen.dart';
import '../screens/launch_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //return HomeScreen();
            return LaunchScreen();
          } else {
            return AuthenticationScreen();
          }
        },
      ),
    );
  }
}
