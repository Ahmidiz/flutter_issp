import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class UusersPage extends StatefulWidget {
  @override
  _UusersPageState createState() => _UusersPageState();
}

class _UusersPageState extends State<UusersPage> {
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
                      return UserContainer(user: users![index]);
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

class UserContainer extends StatelessWidget {
  final User user;

  UserContainer({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
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
                image: MemoryImage(base64Decode(user
                    .propic)), // Assuming user.propic is a base64-encoded string
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${user.id} ${user.name}',
                    style: GoogleFonts.rufina(
                      color: const Color.fromARGB(255, 129, 38, 8),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                Text('           ${user.role}',
                    style: GoogleFonts.aBeeZee(
                      color: Color.fromARGB(255, 23, 22, 22),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                Text('${user.email}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(' ${user.phoneNumber}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/* */