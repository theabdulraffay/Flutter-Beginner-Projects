import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_temp_proj/firebase_options.dart';
import 'package:new_temp_proj/screens/chat_screen.dart';
import 'package:new_temp_proj/screens/login_screen.dart';
import 'package:new_temp_proj/screens/registration_screen.dart';
import 'package:new_temp_proj/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(

      //     bodyMedium: TextStyle(color: Colors.black54),
      //   ),
      // ),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
