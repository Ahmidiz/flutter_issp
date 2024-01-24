import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:issp_app/admin/adding_user.dart';
import 'package:issp_app/admin/log_activities.dart';
//import 'package:issp_app/admin/adding_user.dart';
import 'package:issp_app/admin/manage_user.dart';
//import 'package:issp_app/admin/users.dart';

class UsersTabContent extends StatefulWidget {
  @override
  _UsersTabContentState createState() => _UsersTabContentState();
}

class _UsersTabContentState extends State<UsersTabContent> {
  late TextEditingController searchController;

  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2/isspusers.php'),
    ); // Replace with your API endpoint

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<User> users = jsonList.map((model) => User.fromJson(model)).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 250, 255),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      height: 40.0, // Adjust the height as needed
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onChanged: (value) {
                          // Add your search logic here
                          print('Search Query: $value');
                        },
                      ),
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value == 'adduser') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddUserPage(),
                        ),
                      );
                    } else if (value == 'refreshscreen') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsersTabContent(),
                        ),
                      );
                      // Implement refresh screen logic here
                      print('Refresh Screen');
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return {'Add User', 'Refresh Screen'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice.toLowerCase().replaceAll(' ', ''),
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<User>>(
              future: fetchUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  List<User>? users = snapshot.data;

                  return ListView.builder(
                    itemCount: users?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  UserDetailsPage(user: users[index]),
                            ),
                          );
                        },
                        child: UserContainer(
                          user: users![index],
                          pressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserDetailsPage(user: users[index]),
                              ),
                            );
                          },
                          pressed1: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    LogActivitiesPage(user: users[index]),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final dynamic propic;
  final String role;
  final String phoneNumber;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.propic,
      required this.role,
      required this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['userID'] ?? 0,
      name: json['userFullName'] ?? '',
      email: json['email'] ?? '',
      propic: json['userPic'] ?? '',
      role: json['role'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }
}

class UserContainer extends StatefulWidget {
  final User user;
  final VoidCallback pressed; // Change the type to VoidCallback
  final VoidCallback pressed1;

  const UserContainer(
      {required this.user, required this.pressed, required this.pressed1});

  @override
  _UserContainerState createState() => _UserContainerState();
}

class _UserContainerState extends State<UserContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        height: isExpanded ? 300 : 90, // Adjust the expanded height
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 247, 250, 255),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(231, 204, 184, 179)),
        ),
        child: Row(
          children: [
            Container(
              width: 80, // Adjust the width based on your design
              height: 80, // Adjust the height based on your design
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: MemoryImage(
                    base64Decode(widget.user.propic),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.user.id} ${widget.user.name}',
                    style: GoogleFonts.rufina(
                      color: const Color.fromARGB(255, 129, 38, 8),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '           ${widget.user.role}',
                    style: GoogleFonts.aBeeZee(
                      color: Color.fromARGB(255, 23, 22, 22),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (isExpanded) // Additional widgets when expanded
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.person),
                          onPressed: widget.pressed,
                          style: ButtonStyle(),
                          // Use the passed callback
                        ),
                        Text('Manage User'),
                        IconButton(
                          icon: Icon(Icons.assignment),
                          onPressed: widget.pressed1,
                          style: ButtonStyle(),
                          // Use the passed callback
                        ),
                        Text('View Log Activities'),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: widget.pressed1,
                          style: ButtonStyle(),
                          // Use the passed callback
                        ),
                        Text('Remove User'),

                        // Add more widgets as needed
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UsersTabContent();
  }
}
