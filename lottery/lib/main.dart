import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int x = 4;
  Random rand = Random();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: x == 8
            ? AppBar(
                backgroundColor: Colors.lime.shade400,
                centerTitle: true,
                elevation: 5.0,
                shadowColor: Colors.black,
                title: const Text(
                  'Lottery App',
                ),
              )
            : AppBar(
                backgroundColor: Colors.amber.shade300,
                centerTitle: true,
                elevation: 5.0,
                shadowColor: Colors.black,
                title: const Text(
                  'Lottery App',
                ),
              ),
        backgroundColor: x == 8 ? Colors.lime.shade200 : Colors.amber.shade200,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              'Lottery winning number is 8',
              style: TextStyle(fontSize: 15),
            )),
            // Text(x > 16 ? 'X is greater' : '$x'),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(25)),
              child: x == 8
                  ? const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.done_all, color: Colors.green, size: 45),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'You won!',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.red, size: 35),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Better luck next time you number is $x \ntry again',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x = rand.nextInt(10);
            // print(x.toString());
            setState(() {});
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   int x = 5;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text('My App') ,
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.add),
//           onPressed: () {
//             x++;
//             setState(() {
//
//             });
//             print(x.toString());
//             // print('tap');
//           },
//         ),
//         body: SafeArea(
//             child: Center(
//               child: Text(
//                 x.toString(),
//                 style: const TextStyle(fontSize: 50),
//               ),
//             )
//         ),
//       ),
//     );
//   }
// }
