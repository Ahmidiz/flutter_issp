import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:issp_app/admin/users.dart';

class LogActivity {
  final String logName;
  final String clientId;
  final String report;
  final String feedback;

  LogActivity({
    required this.logName,
    required this.clientId,
    required this.report,
    required this.feedback,
  });

  factory LogActivity.fromJson(Map<String, dynamic> json) {
    return LogActivity(
      logName: json['logName'] ?? '',
      clientId: json['clientId'] ?? '',
      report: json['report'] ?? '',
      feedback: json['feedback'] ?? '',
    );
  }
}

class LogActivitiesPage extends StatefulWidget {
  final User userId;

  LogActivitiesPage({required this.userId});

  @override
  _LogActivitiesPageState createState() => _LogActivitiesPageState();
}

class _LogActivitiesPageState extends State<LogActivitiesPage> {
  late Future<List<LogActivity>> logActivities;

  @override
  void initState() {
    super.initState();
    logActivities = fetchLogActivities();
  }

  Future<List<LogActivity>> fetchLogActivities() async {
    final response = await http.post(
      Uri.parse(
          'http://10.0.2.2/isspslogfetch.php'), // Replace with your API URL
      body: {'userId': widget.userId},
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<LogActivity> logActivities =
          jsonList.map((model) => LogActivity.fromJson(model)).toList();
      return logActivities;
    } else {
      throw Exception('Failed to load log activities');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Activities'),
      ),
      body: FutureBuilder<List<LogActivity>>(
        future: logActivities,
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
            List<LogActivity>? activities = snapshot.data;

            return ListView.builder(
              itemCount: activities?.length,
              itemBuilder: (context, index) {
                return LogActivityContainer(logActivity: activities![index]);
              },
            );
          }
        },
      ),
    );
  }
}

class LogActivityContainer extends StatelessWidget {
  final LogActivity logActivity;

  const LogActivityContainer({required this.logActivity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 109, 179),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Log Name: ${logActivity.logName}'),
          SizedBox(height: 16.0),
          Text('Client ID: ${logActivity.clientId}'),
          SizedBox(height: 16.0),
          Text('Report: ${logActivity.report}'),
          SizedBox(height: 16.0),
          Text('Feedback: ${logActivity.feedback}'),
        ],
      ),
    );
  }
}
