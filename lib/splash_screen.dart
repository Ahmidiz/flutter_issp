import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          children: [
            const SizedBox(
              height: 350,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("IS",
                    style: GoogleFonts.montserrat(
                      color: const Color.fromARGB(255, 105, 114, 58),
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    )),
                Text('SP',
                    style: GoogleFonts.rufina(
                      color: const Color.fromARGB(255, 34, 74, 3),
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
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
