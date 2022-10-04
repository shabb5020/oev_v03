import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreenInitial extends StatefulWidget {
  const HomeScreenInitial({Key? key}) : super(key: key);

  @override
  State<HomeScreenInitial> createState() => _HomeScreenInitialState();
}

class _HomeScreenInitialState extends State<HomeScreenInitial> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('signed in as: ' + user.email!),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.green,
              child: Text('sign out'),
            )
          ],
        ),
      ),
    );
  }
}
