import 'dart:async';

import 'package:coffe_app/constants.dart';
import 'package:coffe_app/models/coffee_shop.dart';
import 'package:coffe_app/view/screens/customize_order_page.dart';
import 'package:coffe_app/view/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key, this.whichCoffee});
  int? whichCoffee;

  double totalPrice(BuildContext context) {
    double total = 0;
    for (int i = 0;
        i < Provider.of<CoffeeShop>(context, listen: false).userCart.length;
        i++) {
      total +=
          Provider.of<CoffeeShop>(context, listen: false).userCart[i].price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, CoffeeShop value, Widget? child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your Cart 🛒',
              style: TextStyle(
                  fontFamily: font,
                  color: fontColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartTile(
                    order: value.userCart[index],
                    cupOfCoffee:
                        value.products[value.userCart[index].selectedCoffe],
                    cups: value.userCart[index].cups,
                    onPressedIcon: () {
                      Provider.of<CoffeeShop>(context, listen: false)
                          .removeItem(value.userCart[index]);
                      value.cups = 0;
                    },
                    onPressed: () {
                      value.cups = value.userCart[index].cups;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CustomizeOrder(
                                  updateOrder: true,
                                  index: index,
                                  selectedCoffe:
                                      value.userCart[index].selectedCoffe)));
                    },
                    icon: Icons.delete_forever_rounded,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        Timer(const Duration(seconds: 1), () {
                          Navigator.of(context).pop(true);
                        });
                        return const AlertDialog(
                          content: Center(
                              child: Text('Your order confirmed successfully')),
                          backgroundColor: backgroundColor,
                          contentTextStyle:
                              TextStyle(fontFamily: font, color: fontColor),
                        );
                      });

                  Timer(const Duration(seconds: 1), () {
                    value.cups = 0;
                    value.clearCart();
                  });
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: buttonBrown,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Confirm order',
                          style: TextStyle(
                            fontFamily: font,
                            color: fontColor,
                            fontSize: 32,
                          ),
                        ),
                        Container(
                          width: 0.5,
                          height: 40,
                          color: const Color(0xffE0E0E0),
                        ),
                        Text(
                          '${totalPrice(context).toStringAsFixed(2)} \$',
                          style: const TextStyle(
                            fontFamily: font,
                            color: fontColor,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      );
    });
  }
}
