import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Car_Item_list.dart';
import 'bottom_bar.dart';
import 'cart_body.dart';
import 'cart_provider.dart';

class Cart extends StatelessWidget {
  List<FoodItem> foodItems;

  @override
  Widget build(BuildContext context) {
    foodItems = Provider.of<CartProvider>(context).foodItems;
    return Scaffold(
      body: SafeArea(
        child: CartBody(foodItems),
      ),
      bottomNavigationBar: BottomBar(foodItems),
    );
  }
}
