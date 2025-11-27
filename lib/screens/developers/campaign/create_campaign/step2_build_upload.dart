// lib/screens/developer/create_campaign/step2_build_upload.dart
import 'package:flutter/material.dart';

class Step2BuildUpload extends StatelessWidget {
  const Step2BuildUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF0066FF), width: 3, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xFF0066FF).withOpacity(0.05),
          ),
          child: Column(
            children: [
              const Icon(Icons.cloud_upload, size: 80, color: Color(0xFF0066FF)),
              const SizedBox(height: 20),
              const Text('Drop APK / IPA here', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const Text('or click to browse', style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.attach_file), label: const Text('Choose File')),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const Text('OR paste TestFlight / Google Play link', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),
        TextField(decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)), hintText: 'https://...')),
      ],
    );
  }
}