//import 'package:bloc_pattern/bloc_pattern.dart';
//import 'package:flutter/material.dart';
//import '../Car_Item_list.dart';
//import 'cartlistBloc.dart';
//import '../cart/bottom_bar.dart';
//import '../cart/cart_body.dart';
//
//class Cart extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
//    List<FoodItem> foodItems;
//    return StreamBuilder(
//      stream: bloc.listStream,
//      builder: (context, snapshot) {
//        if (snapshot.data != null) {
//          foodItems = snapshot.data;
//          return Scaffold(
//            body: SafeArea(
//              child: CartBody(foodItems),
//            ),
//            bottomNavigationBar: BottomBar(foodItems),
//          );
//        } else {
//          return Container(
//            child: Text("Something returned null"),
//          );
//        }
//      },
//    );
//  }
//}