import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text('Dice App'),
      ),
      backgroundColor: Colors.red,
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                autofocus: true,
                onPressed: () {
                  leftDiceNumber++;
                  leftDiceNumber %= 7;
                  if (leftDiceNumber == 0) leftDiceNumber++;
                  setState(() {});
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  rightDiceNumber++;
                  rightDiceNumber %= 7;
                  if (rightDiceNumber == 0) rightDiceNumber++;
                  setState(() {});
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
