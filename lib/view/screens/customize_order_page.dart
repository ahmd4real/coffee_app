import 'dart:async';

import 'package:coffe_app/constants.dart';
import 'package:coffe_app/models/coffee_shop.dart';
import 'package:coffe_app/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomizeOrder extends StatelessWidget {
  CustomizeOrder(
      {super.key,
      required this.selectedCoffe,
      required this.updateOrder,
      this.index = 0});
  final int selectedCoffe;
  final bool updateOrder;
  int index;

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, CoffeeShop value, Widget? child) {
      return Scaffold(

        appBar: AppBar(
          toolbarHeight: 150,
          title: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(
            logo,
          ),
        ),
        centerTitle: true,
          iconTheme: const IconThemeData(color: fontColor),
          backgroundColor: backgroundColor,
        ),
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: ListView(
            children:[ Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  value.products[selectedCoffe].image,
                  width: MediaQuery.of(context).size.width / 1.5,
                )),
                const SizedBox(
                  height: 16,
                ),
                Text(value.products[selectedCoffe].name,
                    style: const TextStyle(
                        color: fontColor,
                        fontSize: 24,
                        fontFamily: font,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  value.products[selectedCoffe].description,
                  style: const TextStyle(
                    fontFamily: font,
                    color: fontColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Provider.of<CoffeeShop>(context, listen: false)
                                  .moreCups();
                            },
                            icon: Container(
                              width: MediaQuery.of(context).size.width * 0.13,
                              height: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: buttonBrown,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: fontColor,
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
                                  fontFamily: font,
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
                              width: MediaQuery.of(context).size.width * 0.13,
                              height: MediaQuery.of(context).size.width * 0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: buttonBrown,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: fontColor,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                updateOrder
                    ? Center(
                        child: InkWell(
                          onTap: () {
                            value.userCart[index].cups = value.cups;
                            value.userCart[index].price =
                                value.cups * value.products[selectedCoffe].price;
            
                            showDialog(
                                context: context,
                                builder: (context) {
                                  Timer(const Duration(seconds: 1), () {
                                    Navigator.of(context).pop(true);
                                  });
                                  return const AlertDialog(
                                    content: Text(
                                      'Your order Updated successfully',
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor: dialogColor,
                                    contentTextStyle: TextStyle(
                                        fontFamily: font, color: fontColor,fontSize: 18),
                                  );
                                });
                            Timer(const Duration(seconds: 1), () {
                              Navigator.of(context).pop(true);
                            });
                            value.cups = 0;
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: buttonBrown,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                                child: Text(
                              'Update Order',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: font,
                                  color: fontColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      )
                    : Center(
                        child: InkWell(
                          onTap: () {
                            if (value.cups == 0) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Timer(const Duration(seconds: 1), () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return const AlertDialog(
                                      content: Text(
                                        'Please add cups of coffee first',
                                        textAlign: TextAlign.center,
                                      ),
                                      backgroundColor: dialogColor,
                                      contentTextStyle: TextStyle(
                                        fontSize: 18,
                                          fontFamily: font, color: fontColor),
                                    );
                                  });
                            } else {
                              Provider.of<CoffeeShop>(context, listen: false)
                                  .addItem(Order(
                                      selectedCoffe: selectedCoffe,
                                      cups: value.cups,
                                      price: value.products[selectedCoffe].price *
                                          value.cups));
            
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    Timer(const Duration(seconds: 1), () {
                                      Navigator.of(context).pop(true);
                                    });
                                    return const AlertDialog(
                                      content: Text(
                                        'Your order Added successfully',
                                        textAlign: TextAlign.center,
                                      ),
                                      backgroundColor: dialogColor,
                                      contentTextStyle: TextStyle(
                                          fontFamily: font, color: fontColor,fontSize: 18),
                                    );
                                  });
            
                              Timer(const Duration(seconds: 1), () {
                                Navigator.of(context).pop(true);
                                value.cups = 0;
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              color: buttonBrown,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                                child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                  fontFamily: font,
                                  color: fontColor,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      )
              ],
            ),
          ]),
        ),
      );
    });
  }
}
