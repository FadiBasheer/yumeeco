import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumeeco_test/cart/cart_provider.dart';
import '../Car_Item_list.dart';

class CartListItem extends StatelessWidget {
  final FoodItem foodItem;

  CartListItem({@required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    foodItem.imgUrl,
                    fit: BoxFit.fitHeight,
                    height: 55,
                    width: 80,
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                        children: [
//                          TextSpan(text: foodItem.quantity.toString()),
//                          TextSpan(text: " x "),
                          TextSpan(text: foodItem.title),
                        ]),
                  ),
                ),
                FlatButton(
                  child: Icon(Icons.delete),
                  onPressed: () {
                    Provider.of<CartProvider>(context,listen: false).removeFromList(foodItem);
                  },
                )
              ],
            ),
            Text(
              "\$${foodItem.quantity * foodItem.price}",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                  fontSize: 19),
            ),
          ],
        ),

    );
  }
}
