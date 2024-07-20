import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class EditScreen extends StatefulWidget {
  String title = '';
  String description = '';
  String id = '';
  EditScreen(
      {super.key,
      required this.description,
      required this.title,
      required this.id});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text = widget.title;
    descriptionController.text = widget.description;
  }

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
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              maxLines: 8,
              minLines: 5,
              keyboardType: TextInputType.multiline,
              decoration:const InputDecoration(hintText: 'Add Description'),
            ),
            const SizedBox(
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
                child: const Center(child: Text('Update')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> postdata() async {
    final uri = Uri.parse('https://api.nstack.in/v1/todos/${widget.id}');
    var text = titleController.text;
    var description = descriptionController.text;
    final data = {
      "title": text,
      "description": description,
      "is_completed": false
    };
    
    final response = await put(uri, body: jsonEncode(data), headers: {'Content-Type': 'application/json'},);

    if(response.statusCode == 200) {
      showMesage('Successfully Updated');
    } else {
      showMesage('Error');
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
