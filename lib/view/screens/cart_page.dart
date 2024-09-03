import 'package:coffe_app/constants.dart';
import 'package:coffe_app/models/coffee_shop.dart';
import 'package:coffe_app/view/screens/customize_order.dart';
import 'package:coffe_app/view/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key, this.whichCoffee});
  int? whichCoffee;

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
              'Your Cart',
              style: TextStyle(
                  color: fontColor, fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<int?, int> order = value.userCart[index];
                  final cupOfCoffee = order.keys;
                  final cups = order.values;
                  print(order);
                  return CartTile(
                      cupOfCoffee: value.products[cupOfCoffee.first!],
                      cups: order.values.first,//value.userCart[index].values.first,
                      onPressed: () {
                        value.cups=value.userCart[index].values.first;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomizeOrder(
                                    selectedCoffe: value.userCart[index].keys.first!
                                        )
                          )
                        );
                      },
                      icon: Icons.delete);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
