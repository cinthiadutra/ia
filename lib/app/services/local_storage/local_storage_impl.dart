import 'package:bkopen/app/services/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorage {
  SharedPreferences? shared;

  @override
  Future get(String key) async {
    shared ??= await SharedPreferences.getInstance();

    return shared!.get(key);
  }

  @override
  Future put(String key, dynamic value) async {
    shared ??= await SharedPreferences.getInstance();

    if (value is bool) {
      shared!.setBool(key, value);
    } else if (value is String) {
      shared!.setString(key, value);
    } else if (value is int) {
      shared!.setInt(key, value);
    } else if (value is double) {
      shared!.setDouble(key, value);
    } else if (value is List<String>) {
      shared!.setStringList(key, value);
    }
  }

  @override
  Future delete(String key) async {
    shared ??= await SharedPreferences.getInstance();

    shared!.remove(key);
  }
}
