import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String username = '', image = '', fname = '', sname = '', email = '';

  @override
  void initState() {
    // TODO: implement initState
    login();
  }

  void login() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    image = sp.getString('image') ?? '';
    email = sp.getString('email') ?? '';
    username = sp.getString('username') ?? '';
    fname = sp.getString('fname') ?? '';
    sname = sp.getString('sname') ?? '';
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Center(child: Text(fname)),
          Center(child: Text(sname)),
          Center(child: Text(username)),
          Center(child: Text(email)),
          Center(child: Image(image: NetworkImage(image))),
        ],
      ),
    );
  }
}
