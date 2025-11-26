import 'package:flutter/material.dart';
import 'package:test_bounty/screens/testers/active_test_screen.dart';
import 'package:test_bounty/screens/testers/earning_screen.dart';
import 'package:test_bounty/screens/testers/test_profile_screen.dart';
import 'tester_home_screen.dart';

class TesterShell extends StatefulWidget {
  const TesterShell({super.key});

  @override
  State<TesterShell> createState() => _TesterShellState();
}

class _TesterShellState extends State<TesterShell> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    TesterHomeScreen(),
    ActiveTestsScreen(),
    EarningsScreen(),
    TesterProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0066FF),
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline), activeIcon: Icon(Icons.play_circle), label: 'Active'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet_outlined), activeIcon: Icon(Icons.account_balance_wallet), label: 'Earnings'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}