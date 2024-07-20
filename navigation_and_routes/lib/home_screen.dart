import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:navigation_and_routes/add_todo.dart';
import 'package:navigation_and_routes/utils/routes_name.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> todos;

  @override
  void initState() {
    super.initState();
    todos = getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Center(child: Text('Add Todo')),
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.screenTwo);
        },
      ),
      body: FutureBuilder<List<dynamic>>(
        future: getAllData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  todos = getAllData();
                });
              },
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(snapshot.data![index]['title']),
                    subtitle: Text(snapshot.data![index]['description']),
                    trailing: PopupMenuButton(

                      onSelected: (value) async {
                        if(value == 'edit'){
                          Navigator.pushNamed(context, RoutesName.editScreen,
                          arguments: {
                            'title' : snapshot.data![index]['title'],
                            'description' : snapshot.data![index]['description'],
                            'id' : snapshot.data![index]['_id']
                          }
                          );

                        } else if (value == 'delete') {
                          String api = 'https://api.nstack.in/v1/todos/';
                          String _id = snapshot.data![index]['_id'];
                          final uri = Uri.parse(api+_id);
                          final response = await http.delete(uri);
                          if(response.statusCode == 200) {
                            print('successfully deleted');
                            print(_id);
                            setState(() {
                              getAllData();
                            });
                          }

                        }
                      },
                        itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                            child: Text('Edit'),
                          value: 'edit',
                        ),
                        PopupMenuItem(
                            child: Text('Delete'),
                          value: 'delete',
                        ),
                      ];
                    }),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  Future<List<dynamic>> getAllData() async {
    final uri = Uri.parse('https://api.nstack.in/v1/todos?page=1&limit=10');
    final response = await http.get(uri);
    final data = jsonDecode(response.body);
    return data['items'];
  }
}
