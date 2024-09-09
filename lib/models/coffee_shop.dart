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
      description:
          'A creamy blend of steamed milk and espresso, perfect for a smooth and rich coffee experience.',
    ),
    Coffee(
      price: 5,
      name: 'Cappuccino',
      image: cappuccino,
      description:
          'A classic Italian coffee with a balance of espresso, steamed milk, and frothy milk foam on top.',
    ),
    Coffee(
      price: 3,
      name: 'Espresso',
      image: espresso,
      description:
          'A bold and intense shot of pure coffee flavor, served in a small, concentrated portion.',
    ),
    Coffee(
      price: 2,
      name: 'Americano',
      image: americano,
      description:
          'A smooth and diluted espresso, made by adding hot water to create a lighter coffee experience.',
    ),
    Coffee(
      price: 6,
      name: 'Mocha',
      image: mocha,
      description:
          'A rich and creamy chocolate-flavored coffee with espresso and steamed milk, perfect for a quick and satisfying coffee experience.',
    ),
    Coffee(
      price: 7,
      name: 'Iced Latte',
      image: icedLatte,
      description:
          'A classic Italian coffee with a rich and creamy flavor, served with ice and steamed milk.',
    ),
    Coffee(
        price: 8,
        name: 'Frappe',
        image: frappe,
        description:
            'A smooth and creamy coffee-flavored drink with espresso and cold milk, perfect for enjoying a coffee and a smooth milkshake.'),
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
