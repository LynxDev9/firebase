import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({
    Key? key,
  }) : super(key: key);

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<QuerySnapshot?>(context);
    print('↧↧↧↧↧↧↧↧↧↧↧↧ bellow ↧↧↧↧↧↧↧↧↧');
    // for(var doc in brews.docs){

    // }
    return Center(child: const Text('home'));
  }
}
