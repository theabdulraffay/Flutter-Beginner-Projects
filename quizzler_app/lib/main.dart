import 'package:flutter/material.dart';
import 'package:quizzler_app/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionsBank bank = QuestionsBank();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: QuizAppMainScreen(),
        ),
      ),
    );
  }
}

class QuizAppMainScreen extends StatefulWidget {
  const QuizAppMainScreen({super.key});

  @override
  State<QuizAppMainScreen> createState() => _QuizAppMainScreenState();
}

class _QuizAppMainScreenState extends State<QuizAppMainScreen> {
  List<Widget> scoreKeeper = [];
  int corretAnswer = 0;

  void state(bool pressed) {
    bool ans = bank.getObject().ans!;
    bank.increment();
    if (pressed == ans) {
      corretAnswer++;
      scoreKeeper.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreKeeper.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    setState(() {});
    if (bank.index == bank.que.length) {
      Alert(
              context: context,
              title: "Quiz App",
              desc: "You got $corretAnswer / ${bank.que.length}")
          .show();
      bank.index = 0;
      corretAnswer = 0;
      scoreKeeper.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  bank.getObject().question!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  state(true);
                },
                child: Text(
                  'TRUE',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size(300, 50),
                  backgroundColor: Colors.green,
                  shape: LinearBorder(),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                onPressed: () {
                  state(false);
                },
                child: Text(
                  'FALSE',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: Size(300, 50),
                  shape: LinearBorder(),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}

class Question {
  String? question;
  bool? ans;
  Question(this.question, this.ans);
}
