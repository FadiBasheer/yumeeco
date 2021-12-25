import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:yumeeco_test/constant/constants.dart';
import '../home.dart';

class SignIn extends StatefulWidget {
  static const String id = 'sign_in';
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  final primaryColor = const Color(0xFF75A2EA);
  final _formKey = GlobalKey<FormState>();
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
        title: Text('Sign in'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
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
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  //onChanged to read the values or any changes inside the formField
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  decoration:
                      textInputDecoration.copyWith(hintText: 'password'),
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      try {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            showSpinner = true;
                          });
                          dynamic result =
                              await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                          setState(() {
                            showSpinner = false;
                          });
                          if (result == null) {
                            error = 'Please register';
                          } else {
                            Navigator.pushNamed(context, Home.id);
                          }
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
                ),
                SizedBox(height: 12.0),
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
