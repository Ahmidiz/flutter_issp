import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:issp_app/admin/users.dart';

class LogActivitiesPage extends StatefulWidget {
  final User user;

  LogActivitiesPage({
    required this.user,
  });

  @override
  _LogActivitiesPageState createState() => _LogActivitiesPageState();
}

class _LogActivitiesPageState extends State<LogActivitiesPage> {
  TextEditingController feedbackController = TextEditingController();
  String clientName = "";
  String projectName = "";
  String projectDescription = "";

  Future<void> fetchData() async {
    try {
      String apiUrl =
          'http://10.0.2.2/isspflogact.php'; // Replace with your actual API URL
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'userId': widget.user.id,
        },
      );

      if (response.statusCode == 200) {
        // If the API call is successful, parse the JSON response
        Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          clientName = data['clientID'];
          projectName = data['logName'];
          projectDescription = data['report'];
        });
      } else {
        // Handle errors here
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any exceptions that may occur during the API call
      print('Error fetching data: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget is initialized
  }

  Future<void> _submitFeedback() async {
    try {
      String apiUrl =
          'http://10.0.2.2/isspmrep_feedback.php'; // Replace with your actual API URL
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'userId': widget.user.id,
          'clientName': clientName,
          'projectName': projectName,
          'projectDescription': projectDescription,
          'feedback': feedbackController.text,
        },
      );

      if (response.statusCode == 200) {
        // Successful API call
        print('Feedback submitted successfully');

        // Navigate to the previous page or perform any other action
        Navigator.pop(context);
      } else {
        // Handle error if the API call was not successful
        print('Failed to submit feedback. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any exceptions that may occur during the API call
      print('Error submitting feedback: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 236, 109, 179),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Text('Client Name: $clientName'),
                  SizedBox(height: 16.0),
                  Text('Project Name: $projectName'),
                  SizedBox(height: 16.0),
                  Text('Project Description: $projectDescription'),
                  SizedBox(height: 32.0),
                  TextField(
                    controller: feedbackController,
                    maxLines: 3,
                    decoration: InputDecoration(labelText: 'Feedback'),
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: _submitFeedback,
                    child: Text('Submit Feedback'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 46, 82, 95),
                    ),
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
