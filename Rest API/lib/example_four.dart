import 'dart:convert';

import 'package:api_tutorial/account.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ExampleFour extends StatefulWidget {
  const ExampleFour({super.key});

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  // List<DummyClass> list = [];
  Future<DummyClass> getData() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/2ec4b41e-8817-4a13-a572-7298f16a520d'));
    var data = jsonDecode(response.body);
    return DummyClass.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Course'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.result.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: () async {
                            SharedPreferences sp = await SharedPreferences.getInstance();
                            // SharedPreferences sp =
                            //     await SharedPreferences.getInstance();
                            print(53624365243);
                            sp.setString('username',
                                snapshot.data!.result[index].username!);
                            sp.setString('image', snapshot.data!.result[index].images[0]);
                            sp.setString('email',snapshot.data!.result[index].emails[0]);
                            sp.setString('fname',snapshot.data!.result[index].name!.first!);
                            sp.setString('sname',snapshot.data!.result[index].name!.last!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AccountScreen()));
                          },
                          title: Row(
                            children: [
                              Text(snapshot.data!.result[index].username!),
                              Icon(
                                snapshot.data!.result[index].status! ==
                                        'active'
                                    ? Icons.check
                                    : Icons.offline_pin,
                                color: snapshot.data!.result[index]
                                            .status! ==
                                        'active'
                                    ? Colors.green
                                    : Colors.blue,
                              )
                            ],
                          ),
                          subtitle:
                              Text(snapshot.data!.result[index].website!),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.data!.result[index].images[0]),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .2,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot
                                  .data!.result[index].images.length,
                              itemBuilder: (context, position) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height *
                                          .25,
                                  width: MediaQuery.of(context).size.width *
                                      .5,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data!
                                              .result[index]
                                              .images[position]))),
                                );
                              }),
                        ),
                      ],
                    );
                  });
            }
          }),
    );
  }
}

class DummyClass {
  DummyClass({
    required this.firstName,
    required this.secondName,
    required this.result,
  });

  final String? firstName;
  final String? secondName;
  final List<Result> result;

  factory DummyClass.fromJson(Map<String, dynamic> json) {
    return DummyClass(
      firstName: json["firstName"],
      secondName: json["secondName"],
      result: json["result"] == null
          ? []
          : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "secondName": secondName,
        "result": result.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$firstName, $secondName, $result, ";
  }
}

class Result {
  Result({
    required this.status,
    required this.name,
    required this.username,
    required this.password,
    required this.emails,
    required this.images,
    required this.phoneNumber,
    required this.location,
    required this.website,
    required this.domain,
    required this.job,
    required this.creditCard,
    required this.uuid,
    required this.objectId,
  });

  final String? status;
  final Name? name;
  final String? username;
  final String? password;
  final List<String> emails;
  final List<String> images;
  final String? phoneNumber;
  final Location? location;
  final String? website;
  final String? domain;
  final Job? job;
  final CreditCard? creditCard;
  final String? uuid;
  final String? objectId;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      status: json["status"],
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      username: json["username"],
      password: json["password"],
      emails: json["emails"] == null
          ? []
          : List<String>.from(json["emails"]!.map((x) => x)),
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      phoneNumber: json["phoneNumber"],
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      website: json["website"],
      domain: json["domain"],
      job: json["job"] == null ? null : Job.fromJson(json["job"]),
      creditCard: json["creditCard"] == null
          ? null
          : CreditCard.fromJson(json["creditCard"]),
      uuid: json["uuid"],
      objectId: json["objectId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "name": name?.toJson(),
        "username": username,
        "password": password,
        "emails": emails.map((x) => x).toList(),
        "images": images.map((x) => x).toList(),
        "phoneNumber": phoneNumber,
        "location": location?.toJson(),
        "website": website,
        "domain": domain,
        "job": job?.toJson(),
        "creditCard": creditCard?.toJson(),
        "uuid": uuid,
        "objectId": objectId,
      };

  @override
  String toString() {
    return "$status, $name, $username, $password, $emails, $images, $phoneNumber, $location, $website, $domain, $job, $creditCard, $uuid, $objectId, ";
  }
}

class CreditCard {
  CreditCard({
    required this.number,
    required this.cvv,
    required this.issuer,
  });

  final String? number;
  final String? cvv;
  final String? issuer;

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      number: json["number"],
      cvv: json["cvv"],
      issuer: json["issuer"],
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "cvv": cvv,
        "issuer": issuer,
      };

  @override
  String toString() {
    return "$number, $cvv, $issuer, ";
  }
}

class Job {
  Job({
    required this.title,
    required this.descriptor,
    required this.area,
    required this.type,
    required this.company,
  });

  final String? title;
  final String? descriptor;
  final String? area;
  final String? type;
  final String? company;

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json["title"],
      descriptor: json["descriptor"],
      area: json["area"],
      type: json["type"],
      company: json["company"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "descriptor": descriptor,
        "area": area,
        "type": type,
        "company": company,
      };

  @override
  String toString() {
    return "$title, $descriptor, $area, $type, $company, ";
  }
}

class Location {
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.zip,
    required this.coordinates,
  });

  final String? street;
  final String? city;
  final String? state;
  final String? country;
  final String? zip;
  final Coordinates? coordinates;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: json["street"],
      city: json["city"],
      state: json["state"],
      country: json["country"],
      zip: json["zip"],
      coordinates: json["coordinates"] == null
          ? null
          : Coordinates.fromJson(json["coordinates"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "country": country,
        "zip": zip,
        "coordinates": coordinates?.toJson(),
      };

  @override
  String toString() {
    return "$street, $city, $state, $country, $zip, $coordinates, ";
  }
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };

  @override
  String toString() {
    return "$latitude, $longitude, ";
  }
}

class Name {
  Name({
    required this.first,
    required this.middle,
    required this.last,
  });

  final String? first;
  final String? middle;
  final String? last;

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      first: json["first"],
      middle: json["middle"],
      last: json["last"],
    );
  }

  Map<String, dynamic> toJson() => {
        "first": first,
        "middle": middle,
        "last": last,
      };

  @override
  String toString() {
    return "$first, $middle, $last, ";
  }
}
