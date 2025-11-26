// lib/screens/developer/create_campaign/step3_targeting.dart
import 'package:flutter/material.dart';

class Step3Targeting extends StatelessWidget {
  const Step3Targeting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(title: Text('Countries'), trailing: Text('Worldwide ▼')),
        const ListTile(title: Text('Languages'), trailing: Text('English, Spanish +12 ▼')),
        SwitchListTile(title: const Text('Phone only'), value: true, onChanged: (_) {}),
        SwitchListTile(title: const Text('Tablet allowed'), value: false, onChanged: (_) {}),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('Demographics (optional)', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        RangeSlider(values: const RangeValues(18, 45), min: 13, max: 70, divisions: 57, labels: const RangeLabels('18', '45'), onChanged: (_) {}),
      ],
    );
  }
}