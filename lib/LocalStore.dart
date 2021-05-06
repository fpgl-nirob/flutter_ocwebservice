import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStore {
  void write(String key, dynamic value);
  dynamic read(String key);
}

class OCLocalStore extends LocalStore {
  static final OCLocalStore _singleton = OCLocalStore._internal();

  factory OCLocalStore() {
    return _singleton;
  }

  OCLocalStore._internal();

  @override
  Future<dynamic> read(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.get(key);
  }

  @override
  Future<void> write(String key, dynamic value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

}