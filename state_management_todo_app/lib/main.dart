import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_todo_app/Screens/task_screen.dart';
import 'package:state_management_todo_app/Widgets/task_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final String data = 'Top secret Code';

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: const MaterialApp(
        home: TaskScreen(),
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: MyText(),
        //   ),
        //   body: Level1(),
        // ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Level2();
  }
}

class Level2 extends StatelessWidget {
  const Level2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

// class Level3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Text(Provider.of<Data>(context).data);
//   }
// }

class MyText extends StatelessWidget {
  const MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context, listen: false).data);
    // return Text(Provider.of<Data>(context).data);
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        Provider.of<Data>(context, listen: false).changeString(newText);
      },
    );
  }
}

class Data extends ChangeNotifier {
  String data = 'Some data';

  void changeString(String newString) {
    data = newString;
    notifyListeners();
  }
}
