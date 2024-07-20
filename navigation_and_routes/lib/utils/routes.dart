

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_and_routes/home_screen.dart';
import 'package:navigation_and_routes/add_todo.dart';
import 'package:navigation_and_routes/utils/edit_screen.dart';
import 'package:navigation_and_routes/utils/routes_name.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings setting ) {
    switch(setting.name) {
      case RoutesName.homeScreen :
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case RoutesName.screenTwo :
        return MaterialPageRoute(builder: (context) => ScreenTwo());

      case RoutesName.editScreen :
        if (setting.arguments is Map<String, dynamic>) {
          final args = setting.arguments as Map<String, dynamic>;
          final title = args['title'];
          final description = args['description'];
          final id = args['id'];

          if (title != null && description != null) {
            return MaterialPageRoute(
              builder: (context) => EditScreen(
                title: title,
                description: description,
                id: id,
              ),
            );
          }
        }
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Center(child: Text('No route defined')),
        ));

      default :
        return MaterialPageRoute(builder: (context) => const Scaffold(
          body: Center(child: Text('No route define')),
        ));
    }
  }
}