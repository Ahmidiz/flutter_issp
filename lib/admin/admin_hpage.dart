// this is a screen that allows the publisher to decide whether to read or publish

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:issp_app/admin/users.dart';
import 'package:issp_app/user/task_form.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 247, 250, 255),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ]),
        body: Center(
          child: Container(
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                  height: 800,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(
                                1.0), // Adjust the padding as needed
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black, // Outline color
                                width: 1.0, // Outline width
                              ),
                              borderRadius: BorderRadius.circular(
                                  8.0), // Adjust the border radius as needed
                            ),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios_sharp),
                              onPressed: () {
                                // Navigate to the previous page
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
                            'Welcome to another beautiful day with INfo Source and we wish you a fruitful day',
                            style: GoogleFonts.pacifico(
                              color: Color.fromARGB(255, 18, 18, 18),
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            )),
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
                                        Color.fromARGB(255, 46, 82, 95)
                                      ],
                                      center: Alignment.center,
                                      startAngle: 0.0,
                                      endAngle: 1 * pi,
                                    )),
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UsersPage()));
                                  },
                                  icon: Icon(Icons.assignment),
                                  label: Text('USERS'),
                                  style: OutlinedButton.styleFrom(
                                    fixedSize: Size(300.0, 100.0),
                                    side: BorderSide.none, // No outline
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0), // Add some space between rows
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
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
                                    )),
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    // Handle button tap
                                  },
                                  icon: Icon(Icons.business_center),
                                  label: Text('CLIENTS'),
                                  style: OutlinedButton.styleFrom(
                                    fixedSize: Size(300.0, 100.0),
                                    side: BorderSide.none, // No outline
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: SweepGradient(
                                  colors: [
                                    Color.fromARGB(255, 46, 82, 95),
                                    Colors.grey,
                                    const Color.fromARGB(255, 239, 71, 71),
                                    Color.fromARGB(255, 46, 82, 95)
                                  ],
                                  center: Alignment.center,
                                  startAngle: 0.0,
                                  endAngle: 1 * pi,
                                )),
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TaskFormPage()));
                              },
                              icon: Icon(Icons.assignment),
                              label: Text('TASKssssssss'),
                              style: OutlinedButton.styleFrom(
                                fixedSize: Size(300.0, 100.0),
                                side: BorderSide.none, // No outline
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ))),
        ));
  }
}
