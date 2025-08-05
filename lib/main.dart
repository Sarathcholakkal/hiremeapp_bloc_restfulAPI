import 'package:flutter/material.dart';
import 'package:hireme_app/presentations/screens/home_screen.dart';
import 'package:hireme_app/presentations/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.white),
      ),

      home: const SplashScreen(),
    );
  }
}
