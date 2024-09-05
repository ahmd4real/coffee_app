import 'package:coffe_app/constants.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:coffe_app/models/order_model.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  CartTile(
      {super.key,
      required this.order,
      required this.cupOfCoffee,
      required this.cups,
       this.onPressedIcon,
      required this.onPressed,
    
      required this.icon});

  final Coffee cupOfCoffee;
  void Function()? onPressed;
  final IconData icon;
  final int cups;
  void Function()? onPressedIcon;
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      shadowColor: buttonBrown,
      color: prodcutColor,
      child: ListTile(
        onTap: onPressed,
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          cupOfCoffee.name,
          style: const TextStyle(
            fontFamily: font,
            color: fontColor,
            fontSize: 24,
          ),
        ),
        leading: Badge(label: Text('$cups'),child: Image.asset(cupOfCoffee.image)),
        subtitle: Text('${order.price.toStringAsFixed(2)} \$',
            style: const TextStyle(
              fontFamily: font,
              color: fontColor,
              fontSize: 12,
            )),
        trailing: IconButton(
          icon: Icon(
            icon,
            color: buttonOrange,
            size: 48,
          ),
          onPressed: onPressedIcon,
        ),
      ),
    );
  }
}
