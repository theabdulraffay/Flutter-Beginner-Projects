import 'package:flutter/material.dart';
import 'package:navigation_and_routes/add_todo.dart';
import 'package:navigation_and_routes/utils/routes.dart';
import 'package:navigation_and_routes/utils/routes_name.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Flutter Demo',
      // initialRoute: HomeScreen.id,
      // routes: {
      //   HomeScreen.id : (context) => HomeScreen(),
      //   ScreenTwo.id : (context) => ScreenTwo(),
      //   // HomeScreen.id : (context) => HomeScreen(),
      // },
      initialRoute: RoutesName.homeScreen,
      onGenerateRoute: Routes.generateRoute,

    );
  }
}

