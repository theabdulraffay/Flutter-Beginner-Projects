import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserClass> list = [];
  Future<List<UserClass>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map i in data) {
        list.add(UserClass.fromJson(i as Map<String, dynamic>));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Card(
                            surfaceTintColor: Colors.brown,
                            shadowColor: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10
                              ),
                              child: Column(
                                children: [
                                  Text(list[index].name!),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(list[index].username!),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(list[index].email!),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(list[index].address.toString()!, textAlign: TextAlign.center,),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(list[index].phone!),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(list[index].website!),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(list[index].company.toString()!, textAlign: TextAlign.center,),
                                ],
                              ),
                            ));
                      });
                }
              })),
    );
  }
}

class UserClass {
  UserClass({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  factory UserClass.fromJson(Map<String, dynamic> json) {
    return UserClass(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
      phone: json["phone"],
      website: json["website"],
      company:
          json["company"] == null ? null : Company.fromJson(json["company"]),
    );
  }
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json["street"],
      suite: json["suite"],
      city: json["city"],
      zipcode: json["zipcode"],
      geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
    );
  }
  @override
  String toString(){
    return "$street, $suite, $city, $zipcode, $geo, ";
  }
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  final String? lat;
  final String? lng;

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json["lat"],
      lng: json["lng"],
    );
  }

  @override
  String toString(){
    return "$lat, $lng, ";
  }
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  final String? name;
  final String? catchPhrase;
  final String? bs;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json["name"],
      catchPhrase: json["catchPhrase"],
      bs: json["bs"],
    );
  }

  @override
  String toString(){
    return "$name, $catchPhrase, $bs, ";
  }
}
