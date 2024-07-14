import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_role_user/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String name = '';
  String email = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    name = sp.getString('name') ?? '';
    email = sp.getString('email')!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/new2.jpg'), fit: BoxFit.fitHeight),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(

              height: MediaQuery.of(context).size.height / 2.66,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 3,
                    color: Colors.green
                  )
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/student.png',
                          ),
                          radius: 33,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            const Text('Student'),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's "),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () async {
                          SharedPreferences sp =
                              await SharedPreferences.getInstance();
                          sp.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(child: Text('Sign Out',
                            style: TextStyle(
                                fontSize: 18, color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
