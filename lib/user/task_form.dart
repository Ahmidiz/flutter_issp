import 'package:flutter/material.dart';

class TaskFormPage extends StatefulWidget {
  const TaskFormPage({super.key});

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  TextEditingController clientNameController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Project Submission Form'),
      ),*/
      backgroundColor: Color.fromARGB(255, 46, 82, 95),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: clientNameController,
                    decoration: InputDecoration(labelText: 'Client Name'),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: projectNameController,
                    decoration: InputDecoration(labelText: 'Project Name'),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: projectDescriptionController,
                    maxLines: 3,
                    decoration:
                        InputDecoration(labelText: 'Project Description'),
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle submission logic
                      String clientName = clientNameController.text;
                      String projectName = projectNameController.text;
                      String projectDescription =
                          projectDescriptionController.text;

                      // Print or process the input data as needed
                      print('Client Name: $clientName');
                      print('Project Name: $projectName');
                      print('Project Description: $projectDescription');
                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 46, 82, 95), // Change button color
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _showSecondFormDialog(context);
              },
              child: Text('Fill Another Form'),
              style: ElevatedButton.styleFrom(fixedSize: Size(20, 10)),
            ),
          ],
        ),
      ),
    );
  }

  _showSecondFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Another Form'),
          content: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Set to minimize height
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Client Name'),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(labelText: 'Project Name'),
                ),
                SizedBox(height: 16.0),
                TextField(
                  decoration: InputDecoration(labelText: 'Project Description'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle second form submission logic
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
