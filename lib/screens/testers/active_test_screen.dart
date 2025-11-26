import 'package:flutter/material.dart';

class ActiveTestsScreen extends StatelessWidget {
  const ActiveTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Active Tests')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.play_circle, size: 100, color: Colors.grey[400]),
            const SizedBox(height: 20),
            const Text('No active tests yet', style: TextStyle(fontSize: 20)),
            const Text('Join a campaign to start testing!', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}