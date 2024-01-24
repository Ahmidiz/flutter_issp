// this file will contain the various codes and assets that will be displayed on the login screen
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:issp_app/admin/admin_hpage.dart';
//import 'package:issp_app/admin/admin_hpage.dart';
import 'package:issp_app/reusable/textbox.dart';
import 'package:issp_app/user/user_hpage.dart';

class LogInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LogInScreen({Key? key}) : super(key: key);

  Future<void> loginUser(
      BuildContext context, String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2/issplogin.php'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'success') {
        final Map<String, dynamic> userDetails = data['user'];

        if (userDetails['role'] == 'admin') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminHomePage(userDetails: userDetails),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserHomePage(userDetails: userDetails),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login failed: ${data['message']}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to connect to the server'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> signUp(BuildContext context) async {
    // Handle your sign-up logic here
    // For example, you can navigate to a sign-up screen
    // or show a dialog for the sign-up process
    print('Navigate to sign-up screen or perform sign-up action');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 25,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 120,
            ),
            /*Row(
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
              ),*/
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
            MyTextField('Email', controller: emailController),
            const SizedBox(
              height: 50,
            ),
            MyTextField('Password', controller: passwordController),
            const SizedBox(
              height: 10,
            ),

            //Text('                                               Dont have an account?'),
            InkWell(
              onTap: () {
                signUp(context);
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Color.fromARGB(255, 54, 174, 244),
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),
            OutlinedButton(
              onPressed: () {
                loginUser(
                    context, emailController.text, passwordController.text);
              },
              style: OutlinedButton.styleFrom(
                fixedSize: const Size(300, 50),
                backgroundColor: Color.fromARGB(255, 105, 114, 58),
              ),
              child: const Text('Log In'),
            ),

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
      ),
    );
  }
}
