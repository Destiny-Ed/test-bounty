import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/screens/main_activity.dart';
import 'package:test_bounty/widgets/glass_container.dart';
import '../providers/role_provider.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            // end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).cardColor,
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).cardColor,
            ],
          ),
        ),
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Who are you?',
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 60),
            _roleCard(
              context,
              'Tester',
              'Earn money testing apps',
              Icons.bug_report,
              UserRole.tester,
            ),
            const SizedBox(height: 30),
            _roleCard(
              context,
              'Developer',
              'Get real feedback fast',
              Icons.code,
              UserRole.developer,
            ),
          ],
        ),
      ),
    );
  }

  Widget _roleCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    UserRole role,
  ) {
    return GestureDetector(
      onTap: () {
        context.read<RoleProvider>().selectRole(role);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MainActivityScreen()),
        );
      },
      child: GlassContainer(
        child: Row(
          children: [
            Icon(icon, size: 50, color: const Color(0xFF00D4B1)),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headlineLarge),
                  Text(subtitle, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Color(0xFF0066FF)),
          ],
        ),
      ),
    );
  }
}
