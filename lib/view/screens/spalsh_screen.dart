import 'package:coffe_app/constants.dart';
import 'package:flutter/material.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}