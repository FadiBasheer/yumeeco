//import 'package:bloc_pattern/bloc_pattern.dart';
//import 'package:flutter/material.dart';
//import 'Car_Item_list.dart';
//import 'Cart_for_delete/cartlistBloc.dart';
//import 'items.dart';
//
//
////class carServises extends StatelessWidget {
////
////  @override
////  Widget build(BuildContext context) {
////    return ListView(
////      children: <Widget>[
////        for (var foodItem in Cevic.foodItems)
////          if (foodItem.id == 1 || foodItem.id == 2)
////            Builder(
////              builder: (context) {
////                return ItemContainer(foodItem: foodItem);
////              },
////            )
////      ],
////    );
////  }
////}
////
//
//
//class ItemContainer extends StatelessWidget {
//  ItemContainer({
//    this.foodItem,
//  });
//
//  final FoodItem foodItem;
//  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
//
//  addToCart(FoodItem foodItem) {
//    bloc.addToList(foodItem);
//  }
//
//  removeFromList(FoodItem foodItem) {
//    bloc.removeFromList(foodItem);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: () {
//        addToCart(foodItem);
//        final snackBar = SnackBar(
//          content: Text('${foodItem.title} added to Cart'),
//          duration: Duration(milliseconds: 550),
//        );
//
//        Scaffold.of(context).showSnackBar(snackBar);
//      },
//      child: Items(
//        hotel: foodItem.hotel,
//        itemName: foodItem.title,
//        itemPrice: foodItem.price,
//        imgUrl: foodItem.imgUrl,
//        leftAligned: (foodItem.id % 2) == 0 ? true : false,
//      ),
//    );
//  }
//}
