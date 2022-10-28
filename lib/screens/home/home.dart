import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () async => _authService.signOut(),
                icon: const Icon(Icons.logout))
          ],
        ),
        body: BrewList());
  }
}
