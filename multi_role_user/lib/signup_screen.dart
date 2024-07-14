import 'package:flutter/material.dart';
import 'package:multi_role_user/student_screen.dart';
import 'package:multi_role_user/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String dropdownvalue = 'Student';

  // List of items in our dropdown menu

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final role = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/logo2.png')),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_rounded),
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.alternate_email),
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    DropdownButton(

                      borderRadius: BorderRadius.circular(10),

                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items:const [
                        DropdownMenuItem(
                          value: 'Teacher',
                            child: Text('Teacher')
                        ),

                        DropdownMenuItem(
                            value: 'Student',
                            child: Text('Student')
                        ),
                      ],
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () async {
                          SharedPreferences sp = await SharedPreferences.getInstance();

                          sp.setString('name', name.text);
                          sp.setString('email', email.text);
                          sp.setString('password', password.text);
                          sp.setString('user', dropdownvalue);
                          sp.setBool('isLogin', true);

                          if(sp.getString('user') == 'Teacher') {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherScreen()));

                          } else if (sp.getString('user') == 'Student') {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StudentScreen()));
                          }

                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          height: 50,
                          child: const Center(child: Text('Sign Up', style: TextStyle(
                              fontSize: 15
                          ),)),

                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}