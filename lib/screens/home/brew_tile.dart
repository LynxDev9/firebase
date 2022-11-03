import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({
    Key? key,
    required this.brs,
  }) : super(key: key);

  final Brew? brs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 2, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.brown[brs?.strenght ?? 50],
            backgroundImage: const AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(brs?.name ?? ''),
          subtitle: Text(brs?.sugars ?? ''),
          // trailing: Text((brs?.strenght ?? 0).toString()),
        ),
      ),
    );
  }
}
