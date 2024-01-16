// this file will contain the various codes and assets that will be displayed on the login screen

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:issp_app/admin/admin_hpage.dart';
import 'package:issp_app/reusable/textbox.dart';
import 'package:issp_app/user/user_hpage.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("IS",
                  style: GoogleFonts.pacifico(
                    color: Color.fromARGB(255, 105, 114, 58),
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  )),
              Text('SP',
                  style: GoogleFonts.rufina(
                    color: Color.fromARGB(255, 34, 74, 3),
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          const SizedBox(
            height: 40,
          ),

          const Text("Welcome to IS Solutions Pro",
              style: TextStyle(
                  color: Color.fromARGB(255, 14, 15, 14),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          const SizedBox(
            height: 70,
          ),
          const MyTextField('Email'),
          const SizedBox(
            height: 50,
          ),
          const MyTextField('Password'),
          const SizedBox(
            height: 10,
          ),

          //Text('                                               Dont have an account?'),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserHomePage()));
              },
              child: const Text(
                '                                                                     Sign Up',
                style: TextStyle(
                  color: Color.fromARGB(255, 54, 174, 244),
                ),
              )),

          const SizedBox(
            height: 50,
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminHomePage()));
              },
              style: OutlinedButton.styleFrom(
                  fixedSize: const Size(300, 50),
                  backgroundColor: Color.fromARGB(255, 105, 114, 58)),
              child: const Text('Log In'))

          /* SizedBox(
              width: 40,
              child:SingleChildScrollView(
               child: Row(children: [
                Expanded(child: Row(children: [Image.asset('assets/images/lock1.jpg', width: 300,),
                Image.asset('assets/images/lock1.jpg', width: 300,),],)
                
               ), ],),
              ),
             ),*/
        ]),
      ),
    );
  }
}
