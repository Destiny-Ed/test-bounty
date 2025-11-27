// lib/screens/developer/create_campaign/step4_testers_schedule.dart
import 'package:flutter/material.dart';

class Step4TestersSchedule extends StatelessWidget {
  const Step4TestersSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Number of testers needed', style: TextStyle(fontSize: 18)),
        Slider(value: 150, min: 10, max: 1000, divisions: 99, label: '150', onChanged: (_) {}),
        Text('150 testers', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: 30),
        const ListTile(title: Text('Test Duration'), trailing: Text('7 days ▼')),
        SwitchListTile(title: const Text('Start immediately'), value: true, onChanged: (_) {}),
      ],
    );
  }
}