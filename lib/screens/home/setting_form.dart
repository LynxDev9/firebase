import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/providers.dart/brews_providers.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingForm extends StatefulWidget {
  const SettingForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SettingForm> createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  bool _isLoading = true;
  UserModel? usr;
  //form values
  String _currentName = '';
  String _currentSugar = '0';
  int _currentStrength = 100;
  Brews? brews;
  @override
  void initState() {
    usr = Provider.of<UserModel?>(context, listen: false);
    brews = Provider.of<Brews>(context, listen: false);
    asyncMeth();

    super.initState();
  }

  asyncMeth() async {
    Brew? temp = await brews?.brew(usr?.uid);
    setState(() {
      _currentName = temp?.name ?? '';
      _currentSugar = temp?.sugars ?? '';
      _currentStrength = temp?.strenght ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Update your brew settings',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: TextEditingController(text: _currentName),
              decoration: inputDecoration.copyWith(hintText: 'name'),
              validator: (val) => val == null ? 'Please enter a name' : null,
              onChanged: (val) => setState(() => _currentName = val),
            ),
            const SizedBox(height: 10.0),
            //dropdown
            DropdownButtonFormField(
              value: _currentSugar,
              decoration: inputDecoration,
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugars'),
                );
              }).toList(),
              onChanged: (val) => setState(() => _currentSugar = val ?? '0'),
            ),
            //slider
            Slider(
              value: _currentStrength.toDouble(),
              activeColor: Colors.brown[_currentStrength],
              min: 100,
              max: 900,
              divisions: 8,
              onChanged: (val) =>
                  setState(() => _currentStrength = val.round()),
            ),
            ElevatedButton(
                //color: Colors.pink[400],
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => brews?.editBrow(
                    usr?.uid, _currentName, _currentSugar, _currentStrength)),
          ],
        ));
  }
}
