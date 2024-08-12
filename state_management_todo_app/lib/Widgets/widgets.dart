import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_todo_app/Widgets/task_data.dart';
// import 'package:state_management_todo_app/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, snapshot) {
            final task = taskData.tasks[snapshot];
            return Padding(
              padding: const EdgeInsets.only(
                left: 30,
              ),
              child: TaskTile(
                longPresscallBack: () {
                  taskData.removeTask(snapshot);
                },
                index: task.name,
                ischecked: task.isDone,
                callBack: (value) {
                  taskData.updateTask(task);
                },
              ),
            );
          },
        );
      },
    );
  }
}

// --------------------------------------------------------------------------------

class TaskTile extends StatelessWidget {
  final String index;
  final bool ischecked;
  final void Function(bool? value)? callBack;
  final void Function()? longPresscallBack;
  const TaskTile({
    this.index = '',
    this.ischecked = false,
    this.callBack,
    this.longPresscallBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPresscallBack,
      title: Text(
        index,
        style: TextStyle(
          decoration: ischecked ? null : TextDecoration.lineThrough,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: ischecked,
        onChanged: callBack,
      ),
    );
  }
}
