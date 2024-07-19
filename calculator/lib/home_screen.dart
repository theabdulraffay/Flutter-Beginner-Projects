import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var user = '';

  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('My App', style: TextStyle(
      //       color: Colors.white
      //   ),),
      //   backgroundColor: Colors.black,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),

                    // Text(answer.toString(), style: TextStyle(
                    //     fontSize: 30,
                    //     color: Colors.white
                    // ),),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // CusContainer(title: 'title'),
                    // CusContainer(title: 'title'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyButton(
                          title: 'AC',
                          onPress: () {
                            user = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          onPress: () {
                            if (user[0] != '-') user = '-$user';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '%',
                          onPress: () {
                            answer += user + '%';
                            user = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '/',
                          color: Colors.orange,
                          onPress: () {
                            answer += user + '/';
                            user = '';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            user += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          onPress: () {
                            user += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '9',
                          onPress: () {
                            user += '9';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'x',
                          color: Colors.orange,
                          onPress: () {
                            answer += user + '*';

                            user = '';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            user += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '5',
                          onPress: () {
                            user += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '6',
                          onPress: () {
                            user += '6';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '-',
                          color: Colors.orange,
                          onPress: () {
                            answer += '$user-';

                            user = '';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            user += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '2',
                          onPress: () {
                            user += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '3',
                          onPress: () {
                            user += '3';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+',
                          color: Colors.orange,
                          onPress: () {
                            answer = '$answer$user+';

                            user = '';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyButton(
                          title: '0',
                          onPress: () {
                            user += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '.',
                          onPress: () {
                            user += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: 'Del',
                          onPress: () {
                            user = user.substring(0, user.length - 1);
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '=',
                            color: Colors.orange,
                            onPress: () {
                              answer += user;
                              user = equal();
                              answer = '';
                              setState(() {

                              });
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String equal() {
    Parser p = Parser();
    Expression exp = p.parse(answer);
    ContextModel c = ContextModel();
    double d = exp.evaluate(EvaluationType.REAL, c);
    return d.toString();
  }
}
