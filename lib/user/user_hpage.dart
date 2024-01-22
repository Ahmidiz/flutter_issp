import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:issp_app/admin/users.dart';
import 'package:issp_app/user/task_form.dart';
import 'package:issp_app/user/user_profile.dart';

class UserHomePage extends StatefulWidget {
  final Map<String, dynamic> userDetails;

  const UserHomePage({Key? key, required this.userDetails}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userDetails = widget.userDetails;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 250, 255),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), label: 'Schedule'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            // Navigate to the Home page
            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (index == 1) {
            // Navigate to the Schedule page
            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => SchedulePage()));
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    UserProfileScreen(userDetails: userDetails),
              ),
            );
          }
        },
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: SizedBox(
            height: 800,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_sharp),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: SweepGradient(
                        colors: [
                          const Color.fromARGB(255, 11, 67, 113),
                          Color.fromARGB(255, 11, 67, 113)
                        ],
                        startAngle: 0.0,
                        endAngle: 2 * pi,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          ' to another day with Info Source, and we wish you a fruitful day',
                          style: GoogleFonts.montserrat(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TaskFormPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.assignment),
                        label: Text('TASKS'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(300.0, 100.0),
                          primary: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UsersPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.supervised_user_circle_sharp),
                        label: Text('USERS'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(300.0, 100.0),
                          primary: Colors.green,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle button tap
                        },
                        icon: Icon(Icons.business_center),
                        label: Text('CLIENTS'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(300.0, 100.0),
                          primary: Colors.orange,
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle button tap
                        },
                        icon: Icon(Icons.feedback),
                        label: Text('FEEDBACK'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(300.0, 100.0),
                          primary: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
