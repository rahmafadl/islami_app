import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_preference.dart';

class MostRecentlyProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void readMostRecentList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> recentlyListAsString =
        prefs.getStringList(SharedPrefskey.mostRecentlyKey) ?? [];
    mostRecentList = recentlyListAsString
        .map((element) => int.parse(element))
        .toList();
    notifyListeners();
  }
}
