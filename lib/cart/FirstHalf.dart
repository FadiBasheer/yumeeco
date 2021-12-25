import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'cart_provider.dart';

class FirstHalf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 25, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    int length=Provider.of<CartProvider>(context).foodItems.length;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (length > 0) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              } else {
                return;
              }
            },
            child: Container(
              margin: EdgeInsets.only(right: 30),
              child: Text(length.toString()),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.yellow[800],
                  borderRadius: BorderRadius.circular(50)),
            ),
          )
        ],
      ),
    );
  }

}
