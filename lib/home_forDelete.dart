//import 'package:bloc_pattern/bloc_pattern.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
//import 'package:provider/provider.dart';
//import 'Car_Item_list.dart';
//import 'car_piker.dart';
//import 'item_container.dart';
//import 'cartlistBloc.dart';
//import 'first_half.dart';
//import 'listTileColorBloc.dart';
//import 'task_data.dart';



////  final _auth = FirebaseAuth.instance;
////  final primaryColor = const Color(0xFF75A2EA);
////  CarItemList fdlist = Cevic;
////
////  String CarModel = 'Cevic';
//
//  @override
//  Widget build(BuildContext context) {
//    return Consumer<TaskData>(
//        builder: (context, taskData, child) {
//      return Scaffold(
//      body: Center(
//          child: Column(
//        children: <Widget>[
//          Expanded(child: CarPicker()),
//        ],
//      )),
//    );
//  });
//}
//}
//
//class Home extends StatelessWidget {
//  static const String id = 'home';
//  @override
//  Widget build(BuildContext context) {
//    return Consumer<TaskData>(builder: (context, taskData, child) {
//      return Text('dsadsd');
//    },);
//  }
//}
//
//    return BlocProvider(
//      blocs: [
//        //add yours BLoCs controlles
//        Bloc((i) => CartListBloc()),
//        Bloc((i) => ColorBloc()),
//      ],
//
//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//      MaterialApp(
////        title: "Car services",
//        home: WillPopScope(
//          onWillPop: () async {
//            await _auth.signOut();
//            return false;
//          },
//          child: Scaffold(
//            backgroundColor: Colors.grey[100],
//            ////////////////////////////////////////////////////// appBar /////////////////////////////////////////////////
//            appBar: AppBar(
//              leading: IconButton(
//                icon: Icon(Icons.arrow_back),
//                onPressed: () async {
//                  await _auth.signOut();
//                  Navigator.pop(context);
//                },
//              ),
//              title: Text('Yumeeco'),
//              backgroundColor: primaryColor,
//              elevation: 0.0,
//              actions: <Widget>[
//                FlatButton.icon(
//                  icon: Icon(Icons.person),
//                  label: Text('logout'),
//                  onPressed: () async {
//                    await _auth.signOut();
//                    Navigator.pop(context);
//                  },
//                ),
//              ],
//            ),
//            //////////////////////////////////////////////////////////// body //////////////////////////////////////////////////////////////
//            body: SafeArea(
//
//              child: Column(
//
//                children: <Widget>[
//                  Flexible(
//                    flex: 1,
//                    // I need to arrive to fdlist
//                    child: CarPicker(),
//                  ),
//
////                    child: CarPicker(
////                      CarModel: CarModel,
////                      addToList: (_value) => setState(() {
////                        CarModel = _value;
////                        if (CarModel == 'Corolla') fdlist = Corolla;
////                      }),
////                    ),
//
//                  //FirstHalf(),
////////////////////////////////////////////////////////////////
////                  Flexible(
////                      flex: 5,
////                      child: ListView.builder(
////                        itemBuilder: (context, index) {
////                           fdlist = Provider.of<TaskData>(context).carItemList;
////                          return ItemContainer(
////                            foodItem: fdlist.foodItems[index],
////                          );
////                        },
////                        itemCount: (fdlist.foodItems.length),
////                      )),
/////////////////////////////////////////////////////////////////////////
//
//
//                  Text(Provider
//                      .of<TaskData>(context).s),
//                  SizedBox(height: 20,),
//
//
////                Flexible(
////                  flex: 6,
////                  child: ListView(
////                    children: <Widget>[
////                      //FirstHalf(),
////
////                      for (var foodItem in fdlist.foodItems)
////                        if (foodItem.id == 1 || foodItem.id == 2)
////                          Builder(
////                            builder: (context) {
////                              return ItemContainer(foodItem: foodItem);
////
//////                            builder: (context) {
//////                              return Container(
//////                                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
//////                                child: SettingsForm(),
//////                              );
//////                            }
////                            },
////                          ),
////                    ],
////                  ),
////                ),
//                ],
//              ),
//            ),
//          ),
//        ),
//
//      ),

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////debugShowCheckedModeBanner: false,
//      );
//  }
//
//}

//
//class HomeScreen extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<HomeScreen> {
//
//
//  @override
//  Widget build(BuildContext context) {
////    void _showSettingsPanel() {
////      showModalBottomSheet(
////          context: context,
////          builder: (context) {
////            return Container(
////              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
////              child: SettingsForm(),
////            );
////          });
////    }
//
//    return StreamProvider<List<Brew>>.value(
//      value: DatabaseService().brews,
//      // the value of value that we just defined above equal to snapshot of Stream<QuerySnapshot> of CollectionReference
//      // WillPopScope: it's used to do sign out when some one
//      child:
//    );
//  }
//}
