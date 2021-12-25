import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // create a collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('costumer');

  //create a new document or record in the brews collection
  Future<void> updateUserData(String name, String PhoneNumber, String note, String DateAndTime, String location) async {
    return await brewCollection.doc(uid).set({
      'Name': name,
      'Phone Number': PhoneNumber,
      'Note': note,
      'Date and Time': DateAndTime,
      'Location': location,
    });
  }

// brew list from snapshot
//  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
//    return snapshot.documents.map((doc) {
//      //print(doc.data);
//      return Brew(
//          name: doc.data['name'] ?? '',
//          strength: doc.data['strength'] ?? 0,
//          sugars: doc.data['sugars'] ?? '0');
//    }).toList();
//  }

// get brews stream
//  Stream<List<Brew>> get brews {
//    return brewCollection.snapshots().map(_brewListFromSnapshot);
//  }
}
