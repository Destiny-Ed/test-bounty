import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/providers/main_activity_provider.dart';
import 'package:test_bounty/screens/developers/dashboard/developer_home_screen.dart';
import 'campaign/campaigns_screen.dart';
import 'report/reports_screen.dart';
import 'wallet/dev_wallet_screen.dart';

class DeveloperShell extends StatelessWidget {
  const DeveloperShell({super.key});

  final List<Widget> _screens = const [
    DeveloperDashboard(),
    CampaignsScreen(),
    ReportsScreen(),
    DevWalletScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainActivityProvider>();
    return Scaffold(
      body: _screens[mainProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainProvider.currentIndex,
        onTap: (i) => mainProvider.currentIndex = i,
        type: BottomNavigationBarType.fixed,
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
