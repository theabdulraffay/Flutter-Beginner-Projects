import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_model.dart';
import 'package:flutter_application_1/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  int counter = 0;
  int get getCounter => counter;
  DatabaseHelper db = DatabaseHelper();

  double tprice = 0.0;
  double get totalPrice => tprice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;
  
  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void setPrefItems() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('cart_item', counter);
    sp.setDouble('total_price', tprice);
    notifyListeners();
  }

  void getPrefItems() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    counter = sp.getInt('cart_item') ?? 0;
    tprice = sp.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addCounter() {
    counter++;
    setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    counter--;
    setPrefItems();
    notifyListeners();
  }

  int getCounters() {
    getPrefItems();
    return counter;
  }

  void addTotalPrice(double price) {
    tprice += price;
    setPrefItems();
    notifyListeners();
  }

  void removetotalPrice(double price) {
    tprice -= price;
    setPrefItems();
    notifyListeners();
  }

  double getTotalPrice() {
    getPrefItems();
    return tprice;
  }
}
