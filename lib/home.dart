import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'Car_Item_list.dart';
import 'car_piker.dart';
import 'cart/FirstHalf.dart';
import 'cart/item_container.dart';
import 'listTileColorBloc.dart';
import 'task_data.dart';

class Home extends StatelessWidget {
  static const String id = 'home';
  final _auth = FirebaseAuth.instance;
  final primaryColor = const Color(0xFF75A2EA);
  CarItemList fdlist = Cevic;
  String CarModel = 'Cevic';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        //add yours BLoCs controlles
        //Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: WillPopScope(
        onWillPop: () async {
          await _auth.signOut();
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          ////////////////////////////////////////////////////// appBar /////////////////////////////////////////////////
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(context);
              },
            ),
            title: Text('Yumeeco'),
            backgroundColor: primaryColor,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          ////////////////////////////////////////////////////////////// body /////////////////////////////////////////////////////////////

          body: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: CarPicker(),
              ),
              FirstHalf(),
              Flexible(
                  flex: 5,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      fdlist = Provider.of<TaskData>(context).carItemList;
                      return ItemContainer(
                        foodItem: fdlist.foodItems[index],
                      );
                    },
                    itemCount: (fdlist.foodItems.length),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
