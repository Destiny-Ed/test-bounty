// lib/screens/developer/create_campaign/step5_rewards_budget.dart
import 'package:flutter/material.dart';

class Step5RewardsBudget extends StatelessWidget {
  const Step5RewardsBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Reward per approved tester', style: TextStyle(fontSize: 18)),
        const Text('\$12.00', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF00D4B1))),
        Slider(value: 12, min: 2, max: 50, divisions: 48, onChanged: (_) {}),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(16)),
          child: const Column(
            children: [
              Text('Total Budget: \$1,800', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              Text('You pay \$1,800 → Testers get \$12 each (20% platform fee)', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }
}