import 'package:flutter/material.dart';
import 'package:oev_v03/screens/login_screen.dart';
import 'package:oev_v03/screens/register_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool displayLoginScreen = true;

  void switchScreen() {
    setState(() {
      displayLoginScreen = !displayLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (displayLoginScreen) {
      return LoginScreen(displayRegisterScreen: switchScreen);
    } else {
      return RegisterScreen(displayLoginScreen: switchScreen);
    }
  }
}
