import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yumeecoclone/bloc/cartlistBloc.dart';
import 'package:yumeecoclone/bloc/listTileColorBloc.dart';
import 'package:yumeecoclone/models/Food_Item.dart';
import 'package:yumeecoclone/models/brew.dart';
import 'package:yumeecoclone/services/auth.dart';
import 'package:yumeecoclone/services/car_piker.dart';
import 'package:yumeecoclone/services/database.dart';
import 'package:yumeecoclone/view/first_half.dart';
import 'package:yumeecoclone/view/car_servises.dart';
import 'settings_form.dart';

class Home extends StatelessWidget {
  static const String id = 'home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        //add yours BLoCs controlles
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
        title: "Food Delivery",
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  final primaryColor = const Color(0xFF75A2EA);
  final AuthService _auth = AuthService();
  FooditemList fdlist = Cevic;
  String CarModel = 'Cevic';

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      // the value of value that we just defined above equal to snapshot of Stream<QuerySnapshot> of CollectionReference
      // WillPopScope: it's used to do sign out when some one
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
                },
              ),
              FlatButton.icon(
                icon: Icon(Icons.settings),
                label: Text('settings'),
                onPressed: () => _showSettingsPanel(),
              )
            ],
          ),
          //////////////////////////////////////////////////////////// body //////////////////////////////////////////////////////////////
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: CarPicker(
                      CarModel: CarModel,
                      addToList: (_value) => setState(() {
                            CarModel = _value;
                            if (CarModel == 'Corolla') fdlist = Corolla;
                          })),
                ),
                FirstHalf(),

                //flex: 6,
//                  child: ListView(
//                    children: <Widget>[
//
//                      for (String st in ch) Text('$st')],
//                  ),

                Flexible(
                    flex: 6,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ItemContainer(
                          foodItem: fdlist.foodItems[index],
                        );
                      },
                      itemCount: (fdlist.foodItems.length),
                    )),

//                Flexible(
//                  flex: 6,
//                  child: ListView(
//                    children: <Widget>[
//                      //FirstHalf(),
//
//                      for (var foodItem in fdlist.foodItems)
//                        if (foodItem.id == 1 || foodItem.id == 2)
//                          Builder(
//                            builder: (context) {
//                              return ItemContainer(foodItem: foodItem);
//
////                            builder: (context) {
////                              return Container(
////                                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
////                                child: SettingsForm(),
////                              );
////                            }
//                            },
//                          ),
//                    ],
//                  ),
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
