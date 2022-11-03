import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/services/database.dart';
import 'package:flutter/foundation.dart';

class Brews with ChangeNotifier {
  List<Brew> _items = [];
  Brew? _item;
  Future<List<Brew>> get brews async {
    await loadBrews();
    return _items;
  }

  Future loadBrews() async {
    _items = await DatabaseService().brews;
    notifyListeners();
  }

  Future<Brew?> brew(String? uid) async {
    await loadBrew(uid);
    return _item;
  }

  Future loadBrew(String? uid) async {
    _item = await DatabaseService(uid: uid).brew;
    notifyListeners();
  }

  Future editBrow(
    String? uid,
    String? name,
    String? sugars,
    int? strenght,
  ) async {
    await DatabaseService(uid: uid)
        .setUserData(name ?? '', sugars ?? '0', strenght ?? 100);
    await loadBrew(uid);
    notifyListeners();
  }
}
