import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/screens/developers/developer_shell.dart';
import 'package:test_bounty/screens/testers/tester_shell.dart';
import '../providers/auth_provider.dart';
import '../providers/role_provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final role = Provider.of<RoleProvider>(context).role;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: () async {
                  await Provider.of<AuthProvider>(
                    context,
                    listen: false,
                  ).signIn("tester");
                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => role == UserRole.tester
                            ? const TesterShell()
                            : const DeveloperShell(),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.g_mobiledata, size: 30),
                label: const Text("Continue with Google"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(16),
                  minimumSize: const Size(double.infinity, 56),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () async {
                  /* same as above */
                },
                icon: const Icon(Icons.apple),
                label: const Text("Continue with Apple"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(16),
                  minimumSize: const Size(double.infinity, 56),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
