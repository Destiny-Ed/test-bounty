// lib/screens/developer/create_campaign/step1_basic_info.dart
import 'package:flutter/material.dart';

class Step1BasicInfo extends StatelessWidget {
  const Step1BasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(decoration: InputDecoration(labelText: 'Campaign Name (internal)', border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
        const SizedBox(height: 20),
        TextField(decoration: InputDecoration(labelText: 'Public App Name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
        const SizedBox(height: 20),
        Container(
          height: 120,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(16)),
          child: const Center(child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey)),
        ),
        const SizedBox(height: 20),
        TextField(maxLines: 3, decoration: InputDecoration(labelText: 'Short Description for Testers', border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
      ],
    );
  }
}