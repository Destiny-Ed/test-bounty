// lib/screens/tester/active_tests_screen.dart
import 'package:flutter/material.dart';
import 'package:test_bounty/screens/testers/active_test/active_test_details_screen.dart';

class ActiveTestsScreen extends StatelessWidget {
  const ActiveTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Active Tests')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(20),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0066FF), Color(0xFF00D4B1)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.sports_esports,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              title: const Text(
                'Battle Arena Game',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ends in 4 days'),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.6,
                    backgroundColor: Colors.grey[300],
                    color: const Color(0xFF00D4B1),
                  ),
                  const Text('60% completed', style: TextStyle(fontSize: 12)),
                ],
              ),
              trailing: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ActiveTestDetailScreen(),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4B1),
                ),
                child: const Text('Continue'),
              ),
            ),
          );
        },
      ),
    );
  }
}
