import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/constants.dart';
import 'package:test_bounty/providers/main_activity_provider.dart';
import 'package:test_bounty/providers/campaign_provider.dart';
import 'package:test_bounty/providers/report_provider.dart';
import 'package:test_bounty/providers/tester_dashboard_provider.dart';
import 'core/theme.dart';
import 'providers/auth_provider.dart';
import 'providers/role_provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const TestBountyApp());
}

class TestBountyApp extends StatelessWidget {
  const TestBountyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => RoleProvider()),
        ChangeNotifierProvider(create: (_) => MainActivityProvider()),
        ChangeNotifierProvider(create: (_) => CampaignProvider()),
        ChangeNotifierProvider(create: (_) => TesterDashboardProvider()),
        ChangeNotifierProvider(create: (_) => ReportProvider()),
      ],
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        home: const SplashScreen(),
      ),
    );
  }
}
