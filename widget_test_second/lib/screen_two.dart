import 'package:flutter/material.dart';

class ScreenTwo extends StatefulWidget {
  static const String id = 'screen_two';
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('List View'),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(
              child: ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                      ),
                      title: Text('Abdul Raffay'),
                      subtitle: Text('03215488838'),
                      trailing: Text('12:38 PM'),
                    );
                  }),
            )
          ],
        ),
        bottomNavigationBar: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Back')),
      ),
    );
  }
}
