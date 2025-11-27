import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text(
          'Detailed bug reports & analytics',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
