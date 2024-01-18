import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2/isspnewuser.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      // User added successfully
      print('User added successfully');
      _showToast('User added successfully', Colors.green);
      // Go back to the previous page
      Navigator.pop(context);
    } else {
      // Failed to add user
      print('Failed to add user: ${response.statusCode}');
      print('Response Body: ${response.body}');
      _showToast('Failed to add user', Colors.red);
    }
  }

  void _showToast(String message, Color backgroundColor) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: backgroundColor,
      textColor: const Color.fromARGB(255, 157, 59, 59),
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: fullNameController,
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: roleController,
              decoration: InputDecoration(labelText: 'Role'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                User newUser = User(
                  userFullName: fullNameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  phoneNumber: phoneNumberController.text,
                  role: roleController.text,
                );

                // Print the JSON data before making the HTTP request
                print(jsonEncode(newUser.toJson()));

                addUser(newUser);
              },
              child: Text('Add User'),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String userFullName;
  final String email;
  final String password;
  final String phoneNumber;
  final String role;

  User({
    required this.userFullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      'userFullName': userFullName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'role': role,
    };
  }
}
