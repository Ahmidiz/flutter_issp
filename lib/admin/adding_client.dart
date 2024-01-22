import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Client {
  final String clientName;
  final String projectName;
  final String projectDescription;

  Client({
    required this.clientName,
    required this.projectName,
    required this.projectDescription,
  });

  Map<String, dynamic> toJson() {
    return {
      'clientName': clientName,
      'projectName': projectName,
      'projectDescription': projectDescription,
    };
  }
}

class AddClientPage extends StatefulWidget {
  @override
  _AddClientPageState createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController projectDescriptionController =
      TextEditingController();

  Future<void> addClient(Client client) async {
    final response = await http.post(
      Uri.parse(
          'http://10.0.2.2/isspnewclient.php'), // Replace with your API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(client.toJson()),
    );

    if (response.statusCode == 201) {
      // Client added successfully
      print('Client added successfully');
      _showToast('Client added successfully', Colors.green);
      Navigator.pop(context);
      // You can perform additional actions here
    } else {
      // Failed to add client
      print('Failed to add client: ${response.statusCode}');
      print('Response Body: ${response.body}');
      _showToast('Failed to add client', Colors.red);
    }
  }

  void _showToast(String message, Color backgroundColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Client'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: clientNameController,
              decoration: InputDecoration(labelText: 'Client Name'),
            ),
            TextField(
              controller: projectNameController,
              decoration: InputDecoration(labelText: 'Project Name'),
            ),
            TextField(
              controller: projectDescriptionController,
              decoration: InputDecoration(labelText: 'Project Description'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Client newClient = Client(
                  clientName: clientNameController.text,
                  projectName: projectNameController.text,
                  projectDescription: projectDescriptionController.text,
                );

                // Print the JSON data before making the HTTP request
                print(jsonEncode(newClient.toJson()));

                addClient(newClient);
              },
              child: Text('Add Client'),
            ),
          ],
        ),
      ),
    );
  }
}
