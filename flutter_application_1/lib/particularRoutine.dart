import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class particularRoutine extends StatefulWidget {
  const particularRoutine({Key? key, required this.exercise}) : super(key: key);

  final Map<String, dynamic>? exercise;

  @override
  State<particularRoutine> createState() => _particularRoutineState();
}

class _particularRoutineState extends State<particularRoutine> {
  @override
  void initState() {
    super.initState();
    fetchData(); // Call the asynchronous method in initState
  }

  Future<void> fetchData() async {
    try {
      print("This is the data");
      print(widget.exercise);

      var response = await http.post(
        Uri.parse("http://10.0.2.2:1000/exercise/myexercise"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(widget.exercise), // Encode the body as JSON
      );

      if (response.statusCode == 200) {
        // Handle the successful response here
        print("Success: ${response.body}");
      } else {
        // Handle the error response here
        print("Error: ${response.statusCode}");
      }
    } catch (error) {
      // Handle any errors that occurred during the http.post operation
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Hello and welcome to Pramila Valley"),
      ),
    );
  }
}
