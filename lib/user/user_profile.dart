import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:issp_app/log_in_screen.dart';

class User {
  String profilePic;
  String name;
  String role;
  String phoneNumber;
  String email;

  User({
    required this.profilePic,
    required this.name,
    required this.role,
    required this.phoneNumber,
    required this.email,
  });
}

class UserProfileScreen extends StatefulWidget {
  final Map<String, dynamic> userDetails;

  UserProfileScreen({required this.userDetails});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late User currentUser;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;

  @override
  void initState() {
    super.initState();

    // Perform null check on widget.userDetails
    if (widget.userDetails != null) {
      currentUser = User(
        profilePic: widget.userDetails['profilePic'] ?? '',
        name: widget.userDetails['name'] ?? '',
        role: widget.userDetails['role'] ?? '',
        phoneNumber: widget.userDetails['phoneNumber'] ?? '',
        email: widget.userDetails['email'] ?? '',
      );

      nameController.text = currentUser.name;
      roleController.text = currentUser.role;
      phoneNumberController.text = currentUser.phoneNumber;
      emailController.text = currentUser.email;
    }
  }

  void _handleSignOut() {
    // Replace with your sign-out logic
    print('User signed out');
  }

  Future<void> _handleUpdateProfile() async {
    // Update user profile with values from controllers
    currentUser.name = nameController.text;
    currentUser.role = roleController.text;
    currentUser.phoneNumber = phoneNumberController.text;
    currentUser.email = emailController.text;

    // Replace with your update profile logic (e.g., API call)
    print('Updating user profile');

    // Show a confirmation dialog or navigate to a different screen upon successful update
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: _pickedImage != null
                    ? FileImage(File(_pickedImage!.path))
                    : (currentUser.profilePic.isNotEmpty
                            ? NetworkImage(currentUser.profilePic)
                            : AssetImage('assets/placeholder_image.png'))
                        as ImageProvider<Object>,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: roleController,
              decoration: InputDecoration(labelText: 'Role'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _handleUpdateProfile,
              child: Text('Update Profile'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogInScreen()));
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
