import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_model.dart';
import 'package:flutter_application_1/cart_provider.dart';
import 'package:flutter_application_1/cart_screen.dart';
import 'package:flutter_application_1/database_helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  DatabaseHelper? db = DatabaseHelper();

  List<String> productName = [
    'Tomato',
    'Potato',
    'Carrot',
    'Apple',
    'Banana',
    'Grapes',
    'Orange'
  ];
  List<String> productUnit = ['KG', 'KG', 'KG', 'KG', 'Dozen', 'KG', 'Dozen'];
  List<int> productPrice = [15, 10, 20, 30, 25, 40, 35];
  List<String> productImage = [
    'https://upload.wikimedia.org/wikipedia/commons/8/88/Bright_red_tomato_and_cross_section02.jpg', // Tomato
    'https://upload.wikimedia.org/wikipedia/commons/3/36/Kartoffel-Aardappel.jpg', // Potato
    'https://upload.wikimedia.org/wikipedia/commons/4/43/Carrot.png', // Carrot
    'https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg', // Apple
    'https://upload.wikimedia.org/wikipedia/commons/8/8a/Banana-Single.jpg', // Banana
    'https://upload.wikimedia.org/wikipedia/commons/f/fb/Table_grapes_on_white.jpg', // Grapes
    'https://upload.wikimedia.org/wikipedia/commons/c/c4/Orange-Fruit-Pieces.jpg' // Orange
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: badges.Badge(
              badgeContent:
                  Consumer<CartProvider>(builder: (context, value, child) {
                return Text(
                  value.getCounters().toString(),
                  style: TextStyle(fontSize: 10),
                );
              }),
              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productImage.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(productImage[index]),
                    ),
                    title: Text(productName[index]),
                    subtitle: Text(
                        '${productPrice[index]} RS/ ${productUnit[index]}'),
                    trailing: InkWell(
                      onTap: () {
                        db!
                            .insert(Cart(
                                id: index,
                                productId: index.toString(),
                                productName: productName[index],
                                initialPrice: productPrice[index],
                                productPrice: productPrice[index],
                                quantity: 1,
                                unitTag: productUnit[index],
                                image: productImage[index]))
                            .then((value) {
                          cart.addTotalPrice(
                              double.parse(productPrice[index].toString()));
                          cart.addCounter();
                          print('Product is added to cart');
                        }).onError((error, stackTrace) {
                          print(error);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        height: 35,
                        width: 100,
                        child: const Center(
                            child: Text(
                          'Add to chart',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  );
                }),
          ),
          
        ],
      ),
    );
  }
}


