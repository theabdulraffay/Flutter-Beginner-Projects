import 'package:flutter/material.dart';
import 'package:widget_test_second/screen_two.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Navigation Drawer'),
          backgroundColor: const Color(0xff764abc),
          elevation: 5,
          shadowColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          semanticLabel: 'Heeey',
          width: 250,
          elevation: 100,
          // backgroundColor: Colors.orange,
          shadowColor: Colors.green,
          child: ListView(children: [
            // DrawerHeader(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.red,
            //   ),
            //   child: const Image(
            //       image: NetworkImage(
            //           'https://media.wired.com/photos/598e35994ab8482c0d6946e0/master/w_1920,c_limit/phonepicutres-TA.jpg')),
            //   // duration: Duration(milliseconds: 3000),
            // ),
            const Padding(padding: EdgeInsets.zero),
            const UserAccountsDrawerHeader(
              accountName: Text('Abdul Raffay'),
              accountEmail: Text('abdulraffay2494@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.wired.com/photos/598e35994ab8482c0d6946e0/master/w_1920,c_limit/phonepicutres-TA.jpg'),
              ),
              decoration: BoxDecoration(
                color: Color(0xff764abc),
              ),
            ),
            ListTile(
              title: const Text('Page 1'),
              leading: const Icon(Icons.keyboard),
              onTap: () {
                Navigator.pushNamed(context, ScreenTwo.id);
              },
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.id);
              },
            ),
            ListTile(
              title: const Text('Page 3'),
              leading: const Icon(Icons.person),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Page 4'),
              leading: const Icon(Icons.phone),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Page 5'),
              leading: const Icon(Icons.web),
              onTap: () {},
            ),
          ]),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ScreenTwo.id);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => ScreenTwo()));
                    },
                    child: const Text(
                      'Main Page',
                      style: TextStyle(fontSize: 20),
                    )))
          ],
        ),
      ),
    );
  }
}
