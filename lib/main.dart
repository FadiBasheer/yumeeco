import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/Food_Item.dart';
import 'models/user.dart';
import 'screeens/home/home.dart';
import 'screeens/wrapper.dart';
import 'services/auth.dart';
import 'view/first_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List countries;

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        //home: Home(),

        // another way using routes
        initialRoute: FirstView.id,
        routes: {
          FirstView.id: (context) => FirstView(),
          Wrapper.id: (context) => Wrapper(),
        },
      ),
    );
  }
}

//MaterialApp(
//home: Scaffold(
//body: ListView.builder(
//itemCount: countries.length,
//itemBuilder: (context, index) {
//return ListTile(
//title: new Text(countries[index]),
//);
//},
//)));
