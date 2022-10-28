import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  final String uid; //UserId
  DatabaseService({ this.uid=''});
//collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');
//Create & Update
  Future setUserData(String sugars, String name, int strenght) async {
    return await brewCollection.doc(uid).set(
        {'sugars': sugars, 'name': name, 'strenght': strenght},
        SetOptions(merge: true)).catchError((onError) {
      if (kDebugMode) {
        print('##this is the error##########');
        print(onError.toString());
      }
    });
  }

  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
