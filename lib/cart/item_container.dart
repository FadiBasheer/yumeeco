import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Car_Item_list.dart';
import '../items.dart';
import 'cart_provider.dart';


class ItemContainer extends StatelessWidget {
  final FoodItem foodItem;

  ItemContainer({
    this.foodItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<CartProvider>(context,listen: false).addToList(foodItem);
        final snackBar = SnackBar(
          content: Text('${foodItem.title} added to Cart'),
          duration: Duration(milliseconds: 550),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Items(
        hotel: foodItem.hotel,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imgUrl,
        leftAligned: (foodItem.id % 2) == 0 ? true : false,
      ),
    );
  }
}
