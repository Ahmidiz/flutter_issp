// this files contain a reusable code for textbox

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const MyTextField(this.hintText, {Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class TextInputContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 310,
          height: 50,
          decoration: BoxDecoration(
            color: Color.fromARGB(252, 255, 255, 255),
            borderRadius: BorderRadius.circular(0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                hintText: 'Enter title',
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 310,
          height: 410,
          decoration: BoxDecoration(
            color: Color.fromARGB(253, 255, 255, 255),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              style: TextStyle(fontSize: 16, color: Colors.yellow),
              maxLines: 23,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: 'Enter text',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter text',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class ReusableDropdown extends StatelessWidget {
  final String? selectedValue; // Make it nullable
  final List<String> options;
  final void Function(String?)? onChanged; // Make it accept nullable String

  const ReusableDropdown({
    required this.selectedValue,
    required this.options,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: onChanged,
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox(this.label, this.hint, {super.key});
  final String label;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            //controller: _controller,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
            ),
          ),
        ],
      ),
    );
  }
}
