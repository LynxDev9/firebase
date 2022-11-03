import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/providers.dart/brews_providers.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:brew_crew/shared/loading.dart';
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
  bool _isLoading=true;
  List<Brew>? brr = [];
  @override
  void initState() {
    asyncMeth();
     setState(() {
      _isLoading=false;
    });
    super.initState();
  }

  asyncMeth() async {
    List<Brew>? temp = await Provider.of<Brews?>(context, listen: false)?.brews;
    setState(() {
      brr = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading? const Loading() : ListView.builder(
        itemCount: brr == null ? 0 : brr!.length,
        itemBuilder: (ctx, i) => BrewTile(brs: brr?[i]));
  }
}
