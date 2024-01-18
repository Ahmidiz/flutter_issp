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
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
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
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
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
                  SizedBox(
                    height: 70,
                    width: 400,
                    child: Text(
                      'Welcome to another beautiful day with Info Source, and we wish you a fruitful day',
                      style: GoogleFonts.pacifico(
                        color: Color.fromARGB(255, 18, 18, 18),
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('What do you want to do '),
                  const SizedBox(
                    height: 100,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: SweepGradient(
                                colors: [
                                  Color.fromARGB(255, 46, 82, 95),
                                  Colors.grey,
                                  const Color.fromARGB(255, 239, 71, 71),
                                  Color.fromARGB(255, 46, 82, 95),
                                ],
                                center: Alignment.center,
                                startAngle: 0.0,
                                endAngle: 1 * pi,
                              ),
                            ),
                            child: OutlinedButton.icon(
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
                              style: OutlinedButton.styleFrom(
                                fixedSize: Size(160.0, 100.0),
                                side: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1.0),
                            ),
                            child: OutlinedButton.icon(
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
                              style: OutlinedButton.styleFrom(
                                fixedSize: Size(160.0, 100.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1.0),
                            ),
                            child: OutlinedButton.icon(
                              onPressed: () {
                                // Handle button tap
                              },
                              icon: Icon(Icons.business_center),
                              label: Text('CLIENTS'),
                              style: OutlinedButton.styleFrom(
                                fixedSize: Size(160.0, 100.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: SweepGradient(
                                colors: [
                                  const Color.fromARGB(255, 239, 71, 71),
                                  Colors.grey,
                                  Color.fromARGB(255, 46, 82, 95),
                                  const Color.fromARGB(255, 239, 71, 71),
                                ],
                                center: Alignment.center,
                                startAngle: 0.0,
                                endAngle: 1 * pi,
                              ),
                            ),
                            child: OutlinedButton.icon(
                              onPressed: () {
                                // Handle button tap
                              },
                              icon: Icon(Icons.feedback),
                              label: Text('FEEDBACK'),
                              style: OutlinedButton.styleFrom(
                                fixedSize: Size(160.0, 100.0),
                                side: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
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
