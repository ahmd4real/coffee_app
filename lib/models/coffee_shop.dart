import 'package:coffe_app/constants.dart';
import 'package:coffe_app/models/coffee_model.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier{
   List<Coffee>products=[
    Coffee(price: 4.99, name: 'latte', image: latte,),
    Coffee(price: 5.99, name: 'capuccino', image: cappuccino),
    Coffee(price: 3.99, name: 'espresso', image:  espresso), 
    Coffee(price: 2.99, name: 'americano', image:  americano),
  ];


   

   Map<int?,int>order={};
   
  List<Map<int?,int>> userCart=[];

  
 

   //add item to cart
   void addItem(Map<int?,int>order){
        userCart.add(order);
        notifyListeners();

   }
    

    //remove items

    void removeItem(Map<int?,int>order){
      userCart.remove(order);
      notifyListeners();
    }

    int cups=0;
    void moreCups(){

      cups++;
      notifyListeners();

    }
    void lessCups(){
      //cups??0;
      cups>0?cups--:cups=0;
      notifyListeners();
    }




}