import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class DatabaseService {
  final String? uid; //UserId
  DatabaseService({this.uid = ''});



//Brew collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');
//Create & Update Brew
  Future setUserData(String name,String sugars,  int strenght) async {
    return await brewCollection.doc(uid).set(
        {'sugars': sugars, 'name': name, 'strenght': strenght},
        SetOptions(merge: true)).catchError((onError) {
      if (kDebugMode) {
        print('##this is the error##########');
        print(onError.toString());
      }
    });
  }

  Future<List<Brew>> get brews async {
    QuerySnapshot data = await brewCollection.get();
    return data.docs.map((e) => Brew.fromMap(e.data())).toList();
  }

  Future<Brew> get brew async {
    DocumentSnapshot data = await brewCollection.doc(uid).get();
    return  Brew.fromMap(data.data());
  }
}
