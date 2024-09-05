import 'package:coffe_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key, this.onTabChange});
  void Function(int)? onTabChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: GNav(
        textStyle: const TextStyle(
          fontFamily: font,
          color: fontColor,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        padding: const EdgeInsets.all(16),
        gap: 1,
          onTabChange: (index) => onTabChange!(index),
          duration: const Duration(milliseconds: 500),
          color: buttonBrown,
          activeColor: fontColor,
          backgroundColor: backgroundColor,
          tabBackgroundColor: buttonBrown,
          mainAxisAlignment: MainAxisAlignment.center,
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
              text: 'Cart',
            ),
          ]
          ),
    );
  }
}
