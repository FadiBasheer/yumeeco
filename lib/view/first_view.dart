import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:yumeeco_test/authenticate/register.dart';
import 'package:yumeeco_test/authenticate/sign_in.dart';

class FirstView extends StatelessWidget {
  static const String id = 'first_view';
  final primaryColor = const Color(0xFF75A2EA);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
//        width: _width,
//        height: _height,
        color: primaryColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top:16,bottom: 50,left: 16,right: 16),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Image(image: AssetImage('images/yumeeco1.png')),
                ),
                Expanded(
                  flex: 3,
                  child: AutoSizeText(
                    "Your Convenient Mechanic Solutions",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 38,
                      color: Colors.white,
                    ),
                  ),
                ),
                ////////////////////////////////////////////////////////// register///////////////////////////////////
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Register.id);
//                    Navigator.of(context).push(
//                        MaterialPageRoute(builder: (context) => Wrapper()));
                    },
                  ),
                ),
                SizedBox(height: _height * 0.05),
                ///////////////////////////////////////////////////////////////////////////Sign in///////////////////////////
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                      child: Text(
                        "Sighn in",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignIn.id);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
