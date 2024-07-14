import 'package:flutter/material.dart';
import 'package:multi_role_user/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
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
    name = sp.getString('name')!;
    email = sp.getString('email')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    colors: [Colors.green, Colors.orange, Colors.pink]),
                image: DecorationImage(
                    image: AssetImage('assets/new.jpg'),
                    fit: BoxFit.fitHeight)),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.66,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 5,
                      color: Colors.brown,
                      style: BorderStyle.solid
                    )

                  ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 50),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const CircleAvatar(
                            radius: 33,
                            backgroundImage: AssetImage('assets/teacher.png'),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style:const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                              const Text('Assistant Professor'),
                            ],
                          ),
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
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Sign Out',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
