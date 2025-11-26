import 'package:flutter/material.dart';

class Step7ReviewLaunch extends StatelessWidget {
  const Step7ReviewLaunch({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.rocket_launch, size: 120, color: Color(0xFF00D4B1)),
        const Text(
          'Ready to launch!',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            '150 testers • \$12 each • 7 days • Worldwide',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () => ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Campaign Launched!'))),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00D4B1),
            minimumSize: const Size(double.infinity, 70),
          ),
          child: const Text(
            'Launch Campaign & Pay \$1,800',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ],
    );
  }
}
