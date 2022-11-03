import 'package:brew_crew/screens/authenticate/sign_in.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/setting_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSetting() {
      showModalBottomSheet(
          backgroundColor: Colors.brown[100],
          context: context,
          builder: (ctx) {
            return Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
                child: SettingForm());
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () async => _authService.signOut(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/coffee_bg.png'),fit: BoxFit.cover)),
          child: const BrewList()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _showSetting,
        child: const Icon(Icons.settings),
      ),
    );
  }
}
