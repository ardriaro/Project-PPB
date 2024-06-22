import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ppbfinal/route.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _fadeInText();
    _navigateToLogin();
  }

  _fadeInText() {
    Timer(Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });
  }

  _navigateToLogin() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, rLogin);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF9C27B0), // Purple shade
              Color(0xFF7B1FA2), // Darker purple shade
            ],
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 2),
            child: const Text(
              'wonderkids',
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins-Bold',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
