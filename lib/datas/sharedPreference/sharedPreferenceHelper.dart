import 'dart:async';

import 'package:datn/datas/sharedPreference/preferences.dart';
import 'package:datn/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceHelper {
  Future<String?> get authToken async {
    final SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    final token =  _sharedPreference.getString(Preferences.auth_token);
    return token;
  }

  Future<bool> saveAuthToken(String authToken) async {
    final SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    var res = await _sharedPreference.setString(Preferences.auth_token, authToken);
    return res;
  }

  Future saveUser(User user) async {
    final SharedPreferences _sharedPreference =
    await SharedPreferences.getInstance();
    List<Future<bool>> _saveUser = List<Future<bool>>.empty(growable: true);
    if (user.phone != null) {
      _saveUser
          .add(_sharedPreference.setString(Preferences.phone, user.phone));
    }
    if (user.id != null) {
      _saveUser.add(_sharedPreference.setInt(Preferences.id, user.id!));
    }
    await Future.wait(_saveUser);
  }

  Future<bool> removeAuthToken() async {
    final SharedPreferences _sharedPreference =
    await SharedPreferences.getInstance();
    return _sharedPreference.remove(Preferences.auth_token);
  }

  Future<User> getUser() async {
    final SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    User user = User(
        firstName: "Q",
        lastName: "d",
        email: "",
        phone: "",
        role: "");
    user.firstName = _sharedPreference.getString("firstName")!;
    user.lastName = _sharedPreference.getString("lastName")!;
    user.phone = _sharedPreference.getString("phone")!;
    user.avatar = _sharedPreference.getString("avatar");
    user.email = _sharedPreference.getString("email")!;
    user.id = _sharedPreference.getInt("id");
    user.gender = _sharedPreference.getBool("gender");
    return user;
  }
}