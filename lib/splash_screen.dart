/*style: GoogleFonts.lato(
              color:const Color.fromARGB(193, 46, 5, 31),fontSize: 24,
              fontWeight: FontWeight.bold,
             ), */

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:issp_app/log_in_screen.dart';
//import 'package:wigoh2_app/screens/log_in_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    navigateToLoginPage() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LogInScreen()),
      );
    }

    // Call the navigation function after a certain duration or completion of a task
    Future.delayed(const Duration(seconds: 3), navigateToLoginPage);

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
                Text("Wi",
                    style: GoogleFonts.pacifico(
                      color: const Color.fromARGB(255, 12, 58, 70),
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                    )),
                Text('GoH',
                    style: GoogleFonts.rufina(
                      color: const Color.fromARGB(255, 129, 38, 8),
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
            /*const SizedBox(height: 320,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                
                const Text("Get Started",style: TextStyle(fontSize: 15),),

                 InkWell(
                   onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LogInScreen()));
           },
               const Icon(Icons.arrow_forward_ios_outlined))
              ],)*/
          ],
        ),
      ),
    ));
  }
}
