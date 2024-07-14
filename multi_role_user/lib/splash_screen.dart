import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_role_user/signup_screen.dart';
import 'package:multi_role_user/student_screen.dart';
import 'package:multi_role_user/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }
  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool login = sp.getBool('isLogin') ?? false;
    if(login) {
      String user =  sp.getString('user') ?? '';
      if(user == 'Teacher') {
        Timer(Duration(seconds: 3), (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherScreen()));
        });
      } else {
        Timer(Duration(seconds: 3), (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      }

    } else {
      Timer(Duration(seconds: 3), (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Image(
          height: double.infinity,
          image: AssetImage('assets/logo1.png'),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}