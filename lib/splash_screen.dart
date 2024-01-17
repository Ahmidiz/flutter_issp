import 'package:flutter/material.dart';
import 'package:issp_app/log_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigateToLoginPage() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    }

    // Call the navigation function after a certain duration or completion of a task
    Future.delayed(const Duration(seconds: 2), navigateToLoginPage);

    return Scaffold(
        body: Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 200,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 248, 248, 249)),
            ),
          ],
        ),
      ),
    ));
  }
}
