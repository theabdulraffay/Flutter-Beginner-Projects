import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.shade800,
          centerTitle: false,
          title: const Text('WhatsApp'),
          bottom: const TabBar(tabs: [
            Tab(child: Icon(Icons.camera_alt)),
            Tab(child: Text('Chat')),
            Tab(child: Text('Status')),
            Tab(child: Text('Calls')),
          ]),
          actions: [
            const Icon(Icons.search),
            const SizedBox(
              width: 15,
            ),
            PopupMenuButton(
                icon: Icon(Icons.more_vert_rounded),
                itemBuilder: (context) => const [
                      PopupMenuItem(
                        value: '1',
                        child: Text('New Group'),
                      ),
                      PopupMenuItem(
                        value: '1',
                        child: Text('Setting'),
                      ),
                      PopupMenuItem(
                        value: '3',
                        child: Text('Log Out'),
                      ),
                    ]),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: TabBarView(
          children: [
            Icon(Icons.camera_alt, size: 50,),
            ListView.builder(
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
            ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Center(child: Text('New Updates'));
                  }
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Colors.teal,
                          )),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                      ),
                    ),
                    title: Text('Abdul Raffay'),
                    subtitle: Text('35m ago'),
                    // trailing: Text('12:38 PM'),
                  );
                }),
            ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/50855/pexels-photo-50855.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                    ),
                    title: Text('Abdul Raffay'),
                    subtitle: Text('Today, 10: 25 AM'),
                    trailing: Icon(index % 2 == 0
                        ? Icons.phone_callback_outlined
                        : Icons.video_call),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
