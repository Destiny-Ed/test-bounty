import 'package:flutter/material.dart';
import 'package:test_bounty/screens/developers/developer_home_screen.dart';
import 'campaigns_screen.dart';
import 'reports_screen.dart';
import 'dev_wallet_screen.dart';

class DeveloperShell extends StatefulWidget {
  const DeveloperShell({super.key});

  @override
  State<DeveloperShell> createState() => _DeveloperShellState();
}

class _DeveloperShellState extends State<DeveloperShell> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    DeveloperDashboard(),
    CampaignsScreen(),
    ReportsScreen(),
    DevWalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0066FF),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Campaigns',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
        ],
      ),
    );
  }
}
