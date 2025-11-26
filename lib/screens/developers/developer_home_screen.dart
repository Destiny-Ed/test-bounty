import 'package:flutter/material.dart';

class DeveloperDashboard extends StatelessWidget {
  const DeveloperDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _metricCard('Active Testers', '127', Icons.people),
          _metricCard('Critical Bugs', '3', Icons.error, color: Colors.red),
          _metricCard('Total Spent', '\$1,842', Icons.paid),
          _metricCard('Avg. Reward', '\$14.50', Icons.attach_money),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF00D4B1),
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('New Campaign'),
      ),
    );
  }

  Widget _metricCard(String title, String value, IconData icon, {Color? color}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color?.withOpacity(0.1) ?? Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color ?? const Color(0xFF0066FF), width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color ?? const Color(0xFF0066FF)),
          const SizedBox(height: 10),
          Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}