import 'package:coffe_app/models/coffee_shop.dart';
import 'package:coffe_app/view/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(CoffeeApp());
  
}

class CoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>CoffeeShop(),
      builder: (context, child) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee App',
        theme: ThemeData(
          //primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      );
      },
    );
  } 
}