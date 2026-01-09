import 'package:expensetracker/Local%20DataBase/AuthDB.dart';
import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  bool _isLoggedIn = false;
  Map<String, dynamic>? _currentUser;

  bool get isLoggedIn => _isLoggedIn;
  Map<String, dynamic>? get currentUser => _currentUser;

  // =====================
  // SIGN UP
  // =====================
  Future<bool> signUp(
      String name, String email, String password) async {
    final exists = await DBHelper.emailExists(email);

    if (exists) {
      return false; // email already exists
    }

    await DBHelper.insertUser(name, email, password);
    return true; // signup success
  }

  // =====================
  // LOGIN
  // =====================
  Future<bool> login(String email, String password) async {
    final user = await DBHelper.loginUser(email, password);

    if (user == null) {
      return false; // invalid credentials
    }

    _currentUser = user;
    _isLoggedIn = true;
    notifyListeners();

    return true; // login success
  }

  // =====================
  // LOGOUT
  // =====================
  void logOut() {
    _isLoggedIn = false;
    _currentUser = null;
    notifyListeners();
  }
}
