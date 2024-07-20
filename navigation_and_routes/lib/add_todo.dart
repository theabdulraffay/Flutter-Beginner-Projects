import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ScreenTwo extends StatefulWidget {
  // static const String id = 'screen_two';
  ScreenTwo({
    super.key,
  });

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final argument = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(hintText: 'Title'),
            ),

            TextField(
              controller: descriptionController,
              maxLines: 8,
              minLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(hintText: 'Add Description'),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: postdata,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: const Center(child: Text('Save')),
              ),
            ),
            // Text(widget.data['name'] ?? 'fg'),
          ],
        ),
      ),
    );
  }

  Future<void> postdata() async {
    var text = titleController.text;
    var description = descriptionController.text;
    final data = {
      "title": text,
      "description": description,
      "is_completed": false
    };

    final uri = Uri.parse('https://api.nstack.in/v1/todos');
    final response = await http.post(uri,
        body: jsonEncode(data),
        headers: {'Content-Type': 'application/json'},

    );
    if (response.statusCode == 201) {
      titleController.text = '';
      descriptionController.text = '';
      showMesage('Successfully created');
    } else {
      showMesage('Error in creating');
    }
  }

  void showMesage(String message) {
    var snackbar = SnackBar(
      content: Text(
        message,
        style: TextStyle(
          color: message.contains('Error') ? Colors.white : Colors.black,
        ),
      ),
      backgroundColor: message.contains('Error') ? Colors.red : Colors.white,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
