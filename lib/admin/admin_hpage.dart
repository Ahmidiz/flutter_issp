import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:issp_app/admin/client.dart';
import 'package:issp_app/admin/users.dart';
import 'package:issp_app/user/task_form.dart';
import 'package:issp_app/user/user_profile.dart';

class AdminHomePage extends StatefulWidget {
  final Map<String, dynamic> userDetails;
  const AdminHomePage({Key? key, required this.userDetails}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
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
            // Navigate to the UserProfileScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfileScreen(
                    userDetails:
                        userDetails), // Replace userDetails with the actual user details
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
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
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
                    width: 400,
                    child: Text(
                      'Welcome to another beautiful day with Infosource Solutions. We wish you a fruitful day!',
                      style: GoogleFonts.montserrat(
                        color: Color.fromARGB(255, 18, 18, 18),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'What would you like to do?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                              builder: (context) => UsersPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.assignment),
                        label: Text('USERS'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(300.0, 100.0),
                          primary: Color.fromARGB(255, 46, 82, 95),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClientsPage(),
                            ),
                          ); // Handle button tap
                        },
                        icon: Icon(Icons.business_center),
                        label: Text('CLIENTS'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(300.0, 100.0),
                          primary: Color.fromARGB(255, 46, 82, 95),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TaskFormPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.assignment),
                        label: Text('TASK'),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(300.0, 100.0),
                          primary: Color.fromARGB(255, 46, 82, 95),
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
