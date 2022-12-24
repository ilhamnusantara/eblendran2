import 'package:eblendrang2/models/models.dart';
import 'package:eblendrang2/models/user_model.dart';
import 'package:eblendrang2/services/auth_service.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  late User _user;

  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      User user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      User user = await AuthService().login(
        username: username,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
