import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_todo_app/Widgets/task_data.dart';
import 'package:state_management_todo_app/task.dart';

class AddTaskScreen extends StatelessWidget {
  // final Function(String val)? onTap;
  // AddTaskScreen({super.key, this.onTap});

  static var controller = TextEditingController();

  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 34,
              ),
            ),
          ),
          TextFormField(
            controller: controller,
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 30,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            
            onTap: () {
              String temp = controller.text;
              controller.text = '';
              var task = Task(name: temp);
              Provider.of<TaskData>(context, listen: false).addTask(task);
              Navigator.pop(context);
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
                shape: BoxShape.rectangle,
              ),
              height: 50,
              child: const Center(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
