import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/providers/main_activity_provider.dart';
import 'package:test_bounty/screens/testers/active_test_screen.dart';
import 'package:test_bounty/screens/testers/earning_screen.dart';
import 'package:test_bounty/screens/testers/test_profile_screen.dart';
import 'tester_home_screen.dart';

class TesterShell extends StatelessWidget {
  const TesterShell({super.key});

  final List<Widget> _screens = const [
    TesterHomeScreen(),
    ActiveTestsScreen(),
    EarningsScreen(),
    TesterProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainActivityProvider>();
    return Scaffold(
      body: _screens[mainProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainProvider.currentIndex,
        onTap: (index) => mainProvider.currentIndex = index,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            activeIcon: Icon(Icons.play_circle),
            label: 'Active',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            activeIcon: Icon(Icons.account_balance_wallet),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
