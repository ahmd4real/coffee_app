import 'package:coffe_app/constants.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:coffe_app/models/order_model.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  List<Coffee> products = [
    Coffee(
      price: 4,
      name: 'Latte',
      image: latte,
    ),
    Coffee(price: 5, name: 'Capuccino', image: cappuccino),
    Coffee(price: 3, name: 'Espresso', image: espresso),
    Coffee(price: 2, name: 'Americano', image: americano),
  ];

  List<Order> userCart = [];

  void addItem(Order order) {
    userCart.add(order);
    notifyListeners();
  }

  void removeItem(Order order) {
    userCart.remove(order);
    notifyListeners();
  }

  void clearCart() {
    userCart.clear();
    notifyListeners();
  }

  int cups = 0;
  void moreCups() {
    cups++;
    notifyListeners();
  }

  void lessCups() {
    cups > 0 ? cups-- : cups = 0;
    notifyListeners();
  }
}
