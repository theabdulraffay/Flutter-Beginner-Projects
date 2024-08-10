import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
// import 'dart:convert';

class AnotherScreen extends StatefulWidget {
  const AnotherScreen({super.key});

  @override
  State<AnotherScreen> createState() => _AnotherScreenState();
}

class _AnotherScreenState extends State<AnotherScreen> {
  List<Photos> list = [];

  Future<List<Photos>> getData() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos')); // Uri = Uniform resource identifier
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        list.add(Photos.fromJson(i));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('API course'),
      ),
      body: Expanded(
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    surfaceTintColor: Colors.brown,
                    shadowColor: Colors.green,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 23,
                        backgroundImage: NetworkImage(list[index].url!),
                      ),
                      title: Text(list[index].title!),
                      subtitle: Text(list[index].url!),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class Photos {
  String? title, url;
  int? albumId;
  Photos({required this.title, required this.url, required this.albumId});

  Photos.fromJson(dynamic json)
      : this(
          title: json['title'] as String?,
          url: json['url'] as String?,
          albumId: json['albumId'] as int?,
        );
}
