import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yumeecoclone/models/user.dart';
import 'authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  static const String id='wrapper';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
