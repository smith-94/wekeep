import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._();
  static SharedPreferences? _prefs;

  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._();

  static init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }


  // FCM 토큰
  static setUser(String id) async {
    await _prefs?.setString('users-info', id);
  }

  static String getUser() {
    return _prefs?.getString('users-info') ?? '';
  }

  static void removeUser() async{
    await _prefs?.remove('users-info');
  }
}
