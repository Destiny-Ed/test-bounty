import 'package:flutter/material.dart';

class DevWalletScreen extends StatelessWidget {
  const DevWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF0066FF),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Center(
                child: Text('\$5,420.00', style: TextStyle(fontSize: 44, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('Add Funds'), style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 56))),
          ],
        ),
      ),
    );
  }
}