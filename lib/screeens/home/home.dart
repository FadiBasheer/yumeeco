import 'package:flutter/material.dart';
import 'package:yumeeco/screeens/wrapper.dart';
import 'package:yumeeco/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final primaryColor = const Color(0xFF75A2EA);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _auth.signOut();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
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
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Card(
                      child: Icon(
                        Icons.warning,
                        color: Colors.red,
                      ),
                    ),
                    Flexible(
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "While we are in the developing process of our app, To get a Quote, give us a call at",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "2368336667",
                              style: TextStyle(color: Colors.red, fontSize: 30),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Flexible(
                // Flexible or Expanded
                child: Container(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    children: <Widget>[
                      SizedBox(height: 45),
                      Image(image: AssetImage('assets/brakes.jpg')),
                      SizedBox(height: 45),
                      Image(image: AssetImage('assets/OilChange.jpg')),
                      SizedBox(height: 45),
                      Image(image: AssetImage('assets/yumeeco1.png')),
                      SizedBox(height: 45),
                      Image(image: AssetImage('assets/yumeeco1.png')),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
