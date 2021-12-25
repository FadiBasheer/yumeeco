import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:yumeeco_test/constant/constants.dart';
import 'package:yumeeco_test/database.dart';
import '../home.dart';
import '../home_forDelete.dart';

class Register extends StatefulWidget {
  static const String id = 'register';
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showSpinner = false;

  final _auth = FirebaseAuth.instance;
  final primaryColor = const Color(0xFF75A2EA);
  final _formKey = GlobalKey<FormState>(); // type of FormState
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        title: Text('Sign up to Yumeeco'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            // associating the global key with our form and this will kep track our form and the state of our form
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  // to chech if is it empty.
                  //onChanged to read the values or any changes inside the formField
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration:
                      textInputDecoration.copyWith(hintText: 'password'),
                  // to hide the password
                  obscureText: true,
                  validator: (val) => val.length < 6
                      ? 'Enter a password 6+ chars long'
                      : null, // to chech if is it less than 6.
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      try {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            showSpinner = true;
                          });
                          dynamic result =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          setState(() {
                            showSpinner = false;
                          });
                          if (result == null) {
                            error = 'Please register';
                          } else {
                            Navigator.pushNamed(context, Home.id);
                          }
                          setState(() {
                            showSpinner = false;
                          });
                        }
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        error = 'Please enter a valid email and password';
                        print(e);
                      }
                    }),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
