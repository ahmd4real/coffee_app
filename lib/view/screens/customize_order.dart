import 'dart:async';
import 'package:coffe_app/constants.dart';
import 'package:coffe_app/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomizeOrder extends StatelessWidget {
  const CustomizeOrder({super.key, required this.selectedCoffe});
  final int selectedCoffe;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, CoffeeShop value, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
        ),
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Image.asset(
              value.products[selectedCoffe].image,
              width: MediaQuery.of(context).size.width / 1.5,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.values[2],
              children: [
                IconButton(
                    onPressed: () {
                      Provider.of<CoffeeShop>(context, listen: false)
                          .moreCups();
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: buttonBrown,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: fontColor,
                        size: 48,
                      ),
                    )),
                Container(
                  width: 120,
                  height: 90,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      '${value.cups}',
                      style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: fontColor),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Provider.of<CoffeeShop>(context, listen: false)
                          .lessCups();
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: buttonBrown,
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: fontColor,
                        size: 48,
                      ),
                    ))
              ],
            ),
            InkWell(
              onTap: () {
                Provider.of<CoffeeShop>(context, listen: false)
                    .addItem({selectedCoffe: value.cups});

                showDialog(
                    context: context,
                    builder: (context) {
                      Timer(const Duration(seconds: 1), () {
                        Navigator.of(context).pop(true);
                      });
                      return const AlertDialog(
                        content: Text('Your order Added successfully'),
                        backgroundColor: backgroundColor,
                        contentTextStyle: TextStyle(color: fontColor),
                      );
                    });

                Timer(const Duration(seconds: 1), () {
                  Navigator.of(context).pop(true);
                   value.cups=0;
                });
               
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: buttonBrown,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                    child: Text(
                  'Add to Cart',
                  style: TextStyle(
                      color: fontColor,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      );
    });
  }
}
