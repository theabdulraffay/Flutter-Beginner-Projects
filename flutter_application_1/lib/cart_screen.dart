import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomeScreen.dart';
import 'package:flutter_application_1/cart_model.dart';
import 'package:flutter_application_1/cart_provider.dart';
import 'package:flutter_application_1/database_helper.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DatabaseHelper db = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My products'),
        centerTitle: true,
        actions: [
          badges.Badge(
            badgeContent:
                Consumer<CartProvider>(builder: (context, value, child) {
              return Text(
                value.getCounters().toString(),
                style: TextStyle(fontSize: 10),
              );
            }),
            child: Icon(Icons.shopping_bag_outlined),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(child: Text('Cart is Empty'));
                  } else {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      snapshot.data![index].image!),
                                ),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(snapshot.data![index].productName!),
                                    InkWell(
                                        onTap: () {
                                          db.delete(snapshot.data![index].id!);
                                          cart.removeCounter();
                                          cart.removetotalPrice(double.parse(
                                              snapshot.data![index].productPrice
                                                  .toString()));
                                        },
                                        child: Icon(
                                            Icons.delete_outline_outlined)),
                                  ],
                                ),
                                subtitle: Text(
                                    '${snapshot.data![index].productPrice!} RS/ ${snapshot.data![index].unitTag!}'),
                                trailing: InkWell(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      height: 35,
                                      width: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                int quantity = snapshot
                                                    .data![index].quantity!;
                                                int price = snapshot
                                                    .data![index].initialPrice!;
                                                quantity--;
                                                int? newprice =
                                                    quantity * price;
                                                if (quantity > 0) {
                                                  db
                                                      .updateQuantity(Cart(
                                                          id: snapshot
                                                              .data![index].id!,
                                                          productId: snapshot
                                                              .data![index].id!
                                                              .toString(),
                                                          productName: snapshot
                                                              .data![index]
                                                              .productName!,
                                                          initialPrice: snapshot
                                                              .data![index]
                                                              .initialPrice!,
                                                          productPrice:
                                                              newprice,
                                                          quantity: quantity,
                                                          unitTag: snapshot
                                                              .data![index]
                                                              .unitTag!,
                                                          image: snapshot
                                                              .data![index]
                                                              .image!))
                                                      .then((value) {
                                                    newprice = 0;
                                                    quantity = 0;
                                                    cart.removetotalPrice(
                                                        double.parse(snapshot
                                                            .data![index]
                                                            .initialPrice
                                                            .toString()));
                                                  }).onError((error, trace) {
                                                    print(error.toString());
                                                  });
                                                }
                                                ;
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              snapshot.data![index].quantity
                                                  .toString(),
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                int quantity = snapshot
                                                    .data![index].quantity!;
                                                int price = snapshot
                                                    .data![index].initialPrice!;
                                                quantity++;
                                                int? newprice =
                                                    quantity * price;
                                                db
                                                    .updateQuantity(Cart(
                                                        id: snapshot
                                                            .data![index].id!,
                                                        productId: snapshot
                                                            .data![index].id!
                                                            .toString(),
                                                        productName: snapshot
                                                            .data![index]
                                                            .productName!,
                                                        initialPrice: snapshot
                                                            .data![index]
                                                            .initialPrice!,
                                                        productPrice: newprice,
                                                        quantity: quantity,
                                                        unitTag: snapshot
                                                            .data![index]
                                                            .unitTag!,
                                                        image: snapshot
                                                            .data![index]
                                                            .image!))
                                                    .then((value) {
                                                  newprice = 0;
                                                  quantity = 0;
                                                  cart.addTotalPrice(
                                                      double.parse(snapshot
                                                          .data![index]
                                                          .initialPrice
                                                          .toString()));
                                                }).onError((error, trace) {
                                                  print(error.toString());
                                                });
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            }));
                  }
                  ;
                } else {}
                return Text('data');
              }),
          Consumer<CartProvider>(builder: (context, value, child) {
            return Visibility(
              visible: value.getTotalPrice().toStringAsFixed(2) == "0.00"
                  ? false
                  : true,
              child: Column(
                children: [
                  ReuseableWidget(
                      title: 'Subtotal',
                      value: '\$' + value.getTotalPrice().toStringAsFixed(2)),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

class ReuseableWidget extends StatelessWidget {
  String title, value;
  ReuseableWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ));
  }
}
