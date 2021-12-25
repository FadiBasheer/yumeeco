import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yumeecoclone/models/brew.dart';
import 'package:yumeecoclone/models/user.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // create a collection reference and we callesd the collection brew
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  //create a new document or record in the brews collection
  Future<void> updateUserData(String sugars, String name) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
    });
  }

  // we will create a brew list from snapshot then we will send it to the home then home will send it to brew_list to use it in the body
  // brewCollection.document(uid).snapshots(); I think i can use this one if I want return just one item
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Brew(
          name: doc.data['name'] ?? '', sugars: doc.data['sugars'] ?? '0');
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid, name: snapshot.data['name'], sugars: snapshot.data['sugars']);
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  //get user doc stream
//  Stream<DocumentSnapshot> get userData {
//    return brewCollection.document(uid).snapshots();
//  }


  //get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
