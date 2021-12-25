import '../listTileColorBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Car_Item_list.dart';
import 'cartlistBloc.dart';
import '../cart/bottom_bar.dart';
import '../cart/cart_body.dart';


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






//class DraggableChildFeedback extends StatelessWidget {
//  const DraggableChildFeedback({
//    Key key,
//    @required this.foodItem,
//  }) : super(key: key);
//
//  final FoodItem foodItem;
//
//  @override
//  Widget build(BuildContext context) {
//    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();
//
//    return Opacity(
//      opacity: 0.7,
//      child: Material(
//        child: StreamBuilder(
//          stream: colorBloc.colorStream,
//          builder: (context, snapshot) {
//            return Container(
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(15),
//                color: snapshot.data != null ? snapshot.data : Colors.white,
//              ),
//              padding: EdgeInsets.all(10),
//              width: MediaQuery.of(context).size.width * 0.95,
//              child: ItemContent(foodItem: foodItem),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}



//
//class DragTargetWidget extends StatefulWidget {
//  final CartListBloc bloc;
//
//  DragTargetWidget(this.bloc);
//
//  @override
//  _DragTargetWidgetState createState() => _DragTargetWidgetState();
//}
//
//class _DragTargetWidgetState extends State<DragTargetWidget> {
//  @override
//  Widget build(BuildContext context) {
//    FoodItem currentFoodItem;
//    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();
//
//    return DragTarget<FoodItem>(
//      onAccept: (FoodItem foodItem) {
//        currentFoodItem = foodItem;
//        colorBloc.setColor(Colors.white);
//        widget.bloc.removeFromList(currentFoodItem);
//      },
//      onWillAccept: (FoodItem foodItem) {
//        colorBloc.setColor(Colors.red);
//        return true;
//      },
////      onLeave: (FoodItem foodItem) {
////        colorBloc.setColor(Colors.white);
////      },
//
//      builder: (BuildContext context, List incoming, List rejected) {
//        return Padding(
//          padding: const EdgeInsets.all(5.0),
//          child: Icon(
//            CupertinoIcons.delete,
//            size: 35,
//          ),
//        );
//      },
//    );
//  }
//}
