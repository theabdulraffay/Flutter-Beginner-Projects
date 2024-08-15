import 'package:flutter/material.dart';
import 'package:gamify/data.dart';

Widget customIcon(IconData data) => Icon(
      data,
      size: 30,
      color: Colors.white,
    );

TextStyle kTextStyle() => const TextStyle(
    fontSize: 15,
    color: Colors.white,
  );


Widget horizontalGamesList(List<Game> games, double height, double width) {
  return SizedBox(
    height: height * .26,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: games.map((game) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          width: width * .33,
          child: Column(
            children: [
              Container(
                height: height * .18,
                width: width * .32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      game.coverImage.url,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Text(
                game.title,
                maxLines: 2,
                style: kTextStyle(),
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}
