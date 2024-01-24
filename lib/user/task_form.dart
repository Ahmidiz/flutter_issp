import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskFormPage extends StatefulWidget {
  const TaskFormPage({Key? key}) : super(key: key);

  @override
  State<TaskFormPage> createState() => _TaskFormPageState();
}

class _TaskFormPageState extends State<TaskFormPage> {
  TextEditingController clientNameController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectDescriptionController = TextEditingController();

  Future<void> _submitForm() async {
    try {
      String apiUrl =
          'http://10.0.2.2/isspmrep.php'; // Replace with your API URL
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'clientName': clientNameController.text,
          'projectName': projectNameController.text,
          'projectDescription': projectDescriptionController.text,
        },
      );

      if (response.statusCode == 200) {
        // Successful API call
        print('Form submitted successfully');

        // Navigate to the previous page
        Navigator.pop(context);
      } else {
        // Handle error if the API call was not successful
        print('Failed to submit form. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any exceptions that may occur during the API call
      print('Error submitting form: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 244, 246),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 236, 109, 179),
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
                      onPressed: _submitForm,
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 46, 82, 95),
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
              mainAxisSize: MainAxisSize.min,
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
                    Navigator.of(context).pop();
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
