import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/providers/role_provider.dart';
import 'package:test_bounty/screens/developers/developer_shell.dart';
import 'package:test_bounty/screens/splash_screen.dart';
import 'package:test_bounty/screens/testers/tester_shell.dart';
import 'package:test_bounty/widgets/social_button.dart';

class MainActivityScreen extends StatefulWidget {
  const MainActivityScreen({super.key});

  @override
  State<MainActivityScreen> createState() => _MainActivityScreenState();
}

class _MainActivityScreenState extends State<MainActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RoleProvider>(
      builder: (context, roleVm, child) {
        switch (roleVm.role) {
          case UserRole.none:
            return Scaffold(
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        "Trespasser!!",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        "You're not supposed to be here",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      10.height(),
                      CustomButton(
                        text: "Go Home",
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SplashScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          case UserRole.tester:
            return TesterShell();
          case UserRole.developer:
            return DeveloperShell();
        }
      },
    );
  }
}
