import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreenNFT extends StatefulWidget {
  const HomeScreenNFT({Key? key}) : super(key: key);

  @override
  State<HomeScreenNFT> createState() => _HomeScreenNFTState();
}

class _HomeScreenNFTState extends State<HomeScreenNFT> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
