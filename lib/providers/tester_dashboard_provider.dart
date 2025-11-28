import 'package:flutter/material.dart';

class TesterDashboardProvider extends ChangeNotifier {
  String _selectedFilter = 'active';

  String get selectedFilter => _selectedFilter;

  set selectedFilter(String value) {
    _selectedFilter = value;
    notifyListeners();
  }

  final List<String> filters = [
    'active',
    'highest pay',
    'newest',
    'android',
    'ios',
    'quick',
  ];
}
