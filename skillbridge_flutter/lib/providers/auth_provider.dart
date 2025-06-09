import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  String? _token;

  bool get isAuthenticated => _user != null;
  User? get user => _user;

  Future<bool> login(String username, String password) async {
    final result = await ApiService.login(username, password);
    if (result['success']) {
      _token = result['token'];
      _user = User.fromJson(result['user']);
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _user = null;
    _token = null;
    notifyListeners();
  }
}
