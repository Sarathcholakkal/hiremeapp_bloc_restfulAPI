import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hireme_app/home_screen.dart';
import 'package:hireme_app/utils/screen_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig.init(context); // initialize once
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/hireme_logo.png',
        width: SizeConfig.screenWidth * 0.1389,
        height: SizeConfig.screenHeight * 0.0825,
        fit: BoxFit.cover,
      ),
    );
  }
}
