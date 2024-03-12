import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite_10/screen/homescreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreeen())));
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/splash.png',
        ),
      ),
    );
  }
}
