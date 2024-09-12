import 'package:discover_app/data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> location = ['Polure', 'Japan', 'Moscow', 'London'];
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: false,
      right: false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * .05,
              0, MediaQuery.of(context).size.width * .05, 0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              mainContent(),
              SizedBox(
                height: 30,
              ),
              LocationBar(locations: location),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              articleList(
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class mainContent extends StatelessWidget {
  const mainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.menu,
          color: Colors.black87,
        ),
        Container(
          height: 39,
          width: 144,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('Assets/images/logo_discover.png'),
            ),
          ),
        ),
        Icon(
          Icons.search,
          size: 35,
        ),
      ],
    );
  }
}

class LocationBar extends StatefulWidget {
  List<String> locations;
  LocationBar({super.key, required this.locations});

  @override
  State<LocationBar> createState() => _LocationBarState();
}

class _LocationBarState extends State<LocationBar> {
  String index = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.065,
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 69, 69, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widget.locations.map((location) {
          bool active = location == index;
          return InkWell(
            onTap: () {
              setState(() {
                index = location;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 15,
                    color: active ? Colors.white : Colors.grey,
                  ),
                ),
                active
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.redAccent,
                        ),
                        height: 3,
                        width: 45,
                      )
                    : Container(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class articleList extends StatelessWidget {
  BuildContext context;
  articleList({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * .05,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      // child: Image.network(articles[index].image),
                      height: MediaQuery.of(context).size.height * .30,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            spreadRadius: 2,
                            blurRadius: 20,
                            offset: Offset(0, 6),
                          ),
                        ],
                        // color: Colors.red,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(articles[index].image),
                        ),
                      ),
                      child: details(
                        index: index,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: .1,
                        blurRadius: 20,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      social(
                        data: Icons.favorite_border,
                        num: articles[index].likes,
                      ),
                      social(
                        data: Icons.comment,
                        num: articles[index].comments,
                      ),
                      social(
                        data: Icons.share,
                        num: articles[index].shares,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class details extends StatelessWidget {
  int index;
  details({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('https://i.pravatar.cc/300'),
                        ),
                        border: Border.all(width: 3, color: Colors.white)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articles[index].author,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '3 Hours Ago',
                        style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 25,
                  ),
                  SizedBox(height: 5),
                  Icon(
                    Icons.bookmark,
                    size: 25,
                    color: Colors.white,
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .04,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.play_arrow,
                color: Colors.red,
                size: 35,
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .50,
                  child: Text(
                    articles[index].title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  articles[index].location,
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: List<Widget>.generate(5, (iindex) {
                    double bol = articles[index].rating - iindex;
                    Icon? star;
                    if (bol >= 1) {
                      star = Icon(
                        Icons.star,
                        color: Colors.amberAccent,
                        size: 15,
                      );
                    } else if (bol >= .5) {
                      star = Icon(
                        Icons.star_half,
                        color: Colors.amberAccent,
                        size: 15,
                      );
                    } else {
                      star = Icon(
                        Icons.star_border,
                        color: Colors.amberAccent,
                        size: 15,
                      );
                    }
                    return star;
                  }),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class social extends StatelessWidget {
  IconData data;
  int num;
  social({super.key, this.data = Icons.comment, this.num = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          data,
          color: Colors.grey,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          num.toString(),
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
