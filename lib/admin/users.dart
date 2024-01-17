import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder<List<User>>(
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
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}

class UserContainer extends StatelessWidget {
  final User user;

  UserContainer({required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ID: ${user.id}'),
          Text('Name: ${user.name}'),
          Text('Email: ${user.email}'),
        ],
      ),
    );
  }
}
