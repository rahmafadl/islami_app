//Save data (Most Recently)
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefskey {
  static const String mostRecentlyKey = 'mostRecentlyKey';
}

void saveLastSura(int suraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentlyList =
      prefs.getStringList(SharedPrefskey.mostRecentlyKey) ?? [];
  if (mostRecentlyList.contains('$suraIndex')) {
    mostRecentlyList.remove('$suraIndex');
    mostRecentlyList.insert(0, '$suraIndex');
  } else {
    mostRecentlyList.insert(0, '$suraIndex');
  }
  if (mostRecentlyList.length > 5) {
    mostRecentlyList.removeLast();
  }
  await prefs.setStringList(SharedPrefskey.mostRecentlyKey, mostRecentlyList);
}

Future<List<int>> readMostRecentList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> recentlyListAsString =
      prefs.getStringList(SharedPrefskey.mostRecentlyKey) ?? [];
  List<int> recentlyListAsInt = recentlyListAsString
      .map((element) => int.parse(element))
      .toList();
  return recentlyListAsInt;
}
