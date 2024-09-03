import 'package:coffe_app/constants.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:coffe_app/models/coffee_shop.dart';
import 'package:coffe_app/view/screens/customize_order.dart';
import 'package:coffe_app/view/widgets/coffe_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, CoffeeShop value, Widget? child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What we have for you',
              style: TextStyle(
                  color: fontColor, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.products.length,
                itemBuilder: (BuildContext context, int index) {
                  Coffee cupOfCoffee = value.products[index];
                  return CoffeTile(
                      icon: Icons.arrow_forward_rounded,
                      cupOfCoffee: cupOfCoffee,
                      onPressed: () {
                        //v//alue.cups = 0;
                       
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomizeOrder(selectedCoffe: index,)));
                      });
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
