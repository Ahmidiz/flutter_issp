// where the code is first run

import 'package:flutter/material.dart';
import 'package:issp_app/splash_screen.dart';

void main() {
  runApp(const MyApp()); // this where the code start running from
}

// the class that contain the material app that is run first
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner:
          false, //removes the debug banner shown when in every default flutter interface
      home:
          SplashScreen(), // calss the Login page which allows user to make input
    );
  }
}
