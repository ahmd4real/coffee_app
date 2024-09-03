import 'package:coffe_app/constants.dart';
import 'package:coffe_app/view/screens/cart_page.dart';
import 'package:coffe_app/view/screens/shop_page.dart';
import 'package:coffe_app/view/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  void navigateScreens(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> pages =  [
    const ShopPage(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: CustomNavBar(
        onTabChange: (index) => navigateScreens(index),
      ),
      body: pages[currentIndex],
    );
  }
}
