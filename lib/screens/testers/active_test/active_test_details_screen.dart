// lib/screens/tester/active_test_detail_screen.dart
import 'package:flutter/material.dart';

class ActiveTestDetailScreen extends StatelessWidget {
  const ActiveTestDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero Header
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Battle Arena: Legends'),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0066FF), Color(0xFF00D4B1)],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: const Icon(
                          Icons.sports_esports,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Reward: \$18.00',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Progress Card
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Progress',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '68% Complete',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF00D4B1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          LinearProgressIndicator(
                            value: 0.68,
                            backgroundColor: Colors.grey[300],
                            color: const Color(0xFF00D4B1),
                            minHeight: 12,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '4 days 6 hours remaining',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Your Tasks',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  _taskTile('Install the game', true),
                  _taskTile('Complete tutorial', true),
                  _taskTile('Play 5 ranked matches', true),
                  _taskTile('Reach Level 10', false),
                  _taskTile('Record 90+ seconds of gameplay', false),
                  _taskTile('Submit feedback questionnaire', false),

                  const Divider(height: 40),

                  const Text(
                    'Test Instructions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: const Text(
                      '• Focus on multiplayer matchmaking\n'
                      '• Test different characters and weapons\n'
                      '• Try to trigger any crashes or lag\n'
                      '• Report UI issues in settings\n'
                      '• Use in-game chat and voice features\n'
                      '• Test on both Wi-Fi and mobile data',
                      style: TextStyle(fontSize: 16, height: 1.7),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // In real app: open screen recorder + overlay tools
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Screen recording started'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          icon: const Icon(Icons.videocam, size: 28),
                          label: const Text(
                            'Start Recording',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0066FF),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Navigate to feedback submission
                          },
                          icon: const Icon(Icons.rate_review, size: 28),
                          label: const Text(
                            'Submit Report',
                            style: TextStyle(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00D4B1),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Leave Test Button
                  OutlinedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Leave this test?'),
                          content: const Text(
                            'You will lose your spot and reward.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.popUntil(
                                context,
                                (r) => r.settings.name == '/tester',
                              ),
                              child: const Text(
                                'Leave',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Leave Test',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _taskTile(String title, bool completed) {
    return ListTile(
      leading: CircleAvatar(
        radius: 16,
        backgroundColor: completed ? Colors.green : Colors.grey[300],
        child: completed
            ? const Icon(Icons.check, size: 20, color: Colors.white)
            : null,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: completed ? FontWeight.normal : FontWeight.bold,
          decoration: completed ? TextDecoration.lineThrough : null,
          color: completed ? Colors.grey : null,
        ),
      ),
    );
  }
}
