import 'package:firebase_auth/firebase_auth.dart';
import 'package:yumeecoclone/models/user.dart';

import 'database.dart';

class AuthService {
//create instance of firebase auth service to use it in th progect
  final FirebaseAuth _auth = FirebaseAuth.instance;

// create user object based on firebaseUser, so we dont take all the information that coming back from user just what we defind in user.dart
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream, we take a stream of user auth like sign in or sign out then change it or map  it to our user wich is just uid
  Stream<User> get user {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in anon
//  Future signInAnon() async {
//    try {
//      //the type of return is AuthResult
//      AuthResult result = await _auth.signInAnonymously();
//      FirebaseUser user = result.user;
//      return _userFromFirebaseUser(user);
//    } catch (e) {
//      print(e.toString());
//      return null;
//    }
//  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      // create a new document for the user with the uid that is auto generated when we created the user
      await DatabaseService(uid: user.uid).updateUserData('0','new crew member');
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}
