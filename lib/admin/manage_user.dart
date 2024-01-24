import 'dart:convert';

//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:issp_app/admin/client.dart';
import 'package:issp_app/admin/users.dart';

class UserDetailsPage extends StatefulWidget {
  final User user;

  UserDetailsPage({required this.user});

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    emailController = TextEditingController(text: widget.user.email);
    // idController = TextEditingController(text: widget.user.id);
    phoneController = TextEditingController(text: widget.user.phoneNumber);
    // Initialize controllers for other user details
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Implement logic to save user details to the database
              // Example: updateUserDetails(widget.user.id);
              Navigator.pop(context); // Close the user details page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              // Display user pic and other details
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: MemoryImage(base64Decode(widget.user.propic)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(
                height: 30,
              )
              // Add other editable user details widgets
              // ...
            ],
          ),
        ),
      ),
    );
  }
}

class ClientDetailsPage extends StatefulWidget {
  final Client client;

  ClientDetailsPage({required this.client});

  @override
  _ClientDetailsPageState createState() => _ClientDetailsPageState();
}

class _ClientDetailsPageState extends State<ClientDetailsPage> {
  late TextEditingController clientNameController;
  late TextEditingController projectNameController;
  late TextEditingController projectDescriptionController;

  @override
  void initState() {
    super.initState();
    clientNameController =
        TextEditingController(text: widget.client.clientName);
    projectDescriptionController =
        TextEditingController(text: widget.client.projectName);
    // idController = TextEditingController(text: widget.user.id);
    projectNameController =
        TextEditingController(text: widget.client.projectDescription);
    // Initialize controllers for other user details
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Implement logic to save user details to the database
              // Example: updateUserDetails(widget.user.id);
              Navigator.pop(context); // Close the user details page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              // Display user pic and other details
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: AssetImage(
                        'assetName'), // MemoryImage(base64Decode(widget.client.id)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: clientNameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: projectNameController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: projectDescriptionController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(
                height: 30,
              )
              // Add other editable user details widgets
              // ...
            ],
          ),
        ),
      ),
    );
  }
}
