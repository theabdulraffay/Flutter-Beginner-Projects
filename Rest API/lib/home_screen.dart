import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Model> list = [];
  Future<List<Model>> getpostApi() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        list.add(Model.fromJson(i));
      }
    }
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('API Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getpostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.brown.withOpacity(.3),
                            surfaceTintColor: Colors.green,
                            child: ListTile(
                              title: Text(list[index].title.toString()),
                              subtitle: Text(list[index].body.toString()),
                              leading: Text(list[index].id.toString()),
                              trailing: Text(list[index].userId.toString()),
                            ),
                          );
                        });
                  }
                }),
          )
        ],
      ),
    );
  }
}
