import 'package:coffe_app/constants.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  CartTile(
      {super.key,
      required this.cupOfCoffee,
      required this.cups,
      required this.onPressed,
      required this.icon});

  final Coffee cupOfCoffee;
  void Function()? onPressed;
  final IconData icon;
  final int cups;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 4,
      shadowColor: buttonBrown,
      color: prodcutColor,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        //isThreeLine: true,
        title: Text(
'$cups ${cupOfCoffee.name}',
          style: const TextStyle(
            color: fontColor,
            fontSize: 24,
          ),
        ),
        leading: Image.asset(cupOfCoffee.image),
        subtitle: Text('${cupOfCoffee.price} \$',
            style: const TextStyle(
              color: fontColor,
              fontSize: 12,
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
