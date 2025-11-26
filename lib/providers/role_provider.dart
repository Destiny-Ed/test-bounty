import 'package:flutter/material.dart';

enum UserRole { none, tester, developer }

class RoleProvider with ChangeNotifier {
  UserRole _role = UserRole.none;
  UserRole get role => _role;

  void selectRole(UserRole role) {
    _role = role;
    notifyListeners();
  }
}