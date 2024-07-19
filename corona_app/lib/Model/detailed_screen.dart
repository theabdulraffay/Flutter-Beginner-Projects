import 'package:corona_app/world_stats.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  dynamic? countryInfo;
  DetailedScreen({super.key, this.countryInfo});

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  Color color = Colors.orange.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        centerTitle: true,
        title: Text(widget.countryInfo['country'].toString()),
      ),
      backgroundColor: color,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  color: Colors.yellow.shade100,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .067,
                      ),
                      ReUseAble(
                          title: 'Country',
                          value: (widget.countryInfo['country'].toString())),
                      ReUseAble(
                          title: 'cases',
                          value: widget.countryInfo['cases'].toString()),
                      ReUseAble(
                          title: 'Deaths',
                          value: widget.countryInfo['deaths'].toString()),
                      ReUseAble(
                          title: 'Recovered',
                          value: widget.countryInfo['recovered'].toString())
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage:
                    NetworkImage(widget.countryInfo['countryInfo']['flag']),
              ),
            ],
          ),
          // Text(widget.countryInfo['country'].toString()),
          // Text(widget.countryInfo['cases'].toString()),
          // Text(widget.countryInfo['deaths'].toString()),
          // Text(widget.countryInfo['recovered'].toString()),
          // Image(image: NetworkImage(
          //   widget.countryInfo['countryInfo']['flag']
          // ))
        ],
      ),
    );
  }
}
