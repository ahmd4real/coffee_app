import 'package:coffe_app/constants.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:flutter/material.dart';

class CoffeTile extends StatelessWidget {
  CoffeTile(
      {super.key,
      required this.cupOfCoffee,
      required this.onPressed,
      required this.icon});

  final Coffee cupOfCoffee;
  void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      color: prodcutColor,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        title: Text(
          cupOfCoffee.name,
          style: const TextStyle(
            fontFamily: font,
            color: fontColor,
            fontSize: 24,
          ),
        ),
        leading: Image.asset(cupOfCoffee.image),
        subtitle: Text('${cupOfCoffee.price.toStringAsFixed(2)} \$',
            style: const TextStyle(
              fontFamily: font,
              color: Color.fromARGB(255, 224, 224, 224),
              fontSize: 16,
            )),
        trailing: IconButton(
          icon: Icon(
            icon,
            color: buttonOrange,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
