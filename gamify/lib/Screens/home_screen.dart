import 'package:flutter/material.dart';
import 'package:gamify/contants.dart';
import 'package:gamify/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screenheight;
  var screenwidth;
  int selectedmovie = 0;

  @override
  Widget build(BuildContext context) {
    screenheight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          _featuresGames(),
          gradient(),
          topLayerWidget(),
        ],
      ),
    );
  }

  Widget _featuresGames() {
    return SizedBox(
      height: screenheight * .50,
      width: screenwidth,
      child: PageView(
        onPageChanged: ((value) {
          setState(() {
            selectedmovie = value;
          });
        }),
        children: featuredGames.map((games) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(games.coverImage.url),
              ),
            ),
            // child: featuresmovieIndex(),
          );
        }).toList(),
      ),
    );
  }

  Widget gradient() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: screenheight * .77,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [
                .85,
                1
              ],
              colors: [
                Color.fromRGBO(35, 45, 59, 1.0),
                Colors.transparent,
              ]),
        ),
      ),
    );
  }

  Widget topLayerWidget() {
    return Padding(
      padding: EdgeInsets.only(
        top: screenheight * .050,
        right: screenwidth * .030,
        left: screenwidth * .030,
      ),
      child: Column(
        children: [
          appBar(),
          SizedBox(height: screenheight * 0.13),
          featuresmovieIndex(),
          // SizedBox(
          //   height
          // ),
          horizontalGamesList(games2, screenheight, screenwidth),
          featureGameBanner(),
          horizontalGamesList(games, screenheight, screenwidth),
        ],
      ),
    );
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        customIcon(Icons.menu),
        Row(
          children: [
            customIcon(Icons.search),
            customIcon(Icons.notifications_none),
          ],
        )
      ],
    );
  }

  Widget featuresmovieIndex() {
    return Column(
      children: [
        Text(
          featuredGames[selectedmovie].title,
          maxLines: 2,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
        SizedBox(
          height: screenheight * .004,
        ),
        Row(
          children: featuredGames.map((games) {
            bool active = featuredGames[selectedmovie].title == games.title;
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: CircleAvatar(
                radius: 3,
                backgroundColor: active ? Colors.green : Colors.grey,
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Widget featureGameBanner() {
    return SizedBox(
      height: screenheight * .10,
      width: screenwidth,
      child: PageView(
        scrollDirection: Axis.vertical,
        children: featuredGames.map((game) {
          return Container(
            height: screenheight * .05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                  game.coverImage.url,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
