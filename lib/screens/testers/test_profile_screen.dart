import 'package:flutter/material.dart';

class TesterProfileScreen extends StatelessWidget {
  const TesterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(radius: 60, backgroundColor: Color(0xFF0066FF), child: Icon(Icons.person, size: 60, color: Colors.white)),
          const SizedBox(height: 20),
          const Center(child: Text('Alex Chen', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold))),
          const Center(child: Text('Diamond Tester • Level 42', style: TextStyle(color: Colors.grey))),
          const Divider(height: 40),
          _statTile('Tests Completed', '184'),
          _statTile('Acceptance Rate', '98%'),
          _statTile('Total Earned', '\$2,847'),
          const Divider(height: 40),
          ListTile(leading: const Icon(Icons.settings), title: const Text('Settings'), onTap: () {}),
          ListTile(leading: const Icon(Icons.help), title: const Text('Help & Support'), onTap: () {}),
        ],
      ),
    );
  }

  Widget _statTile(String label, String value) {
    return ListTile(
      title: Text(label),
      trailing: Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0066FF))),
    );
  }
}