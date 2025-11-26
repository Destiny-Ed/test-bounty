import 'package:flutter/material.dart';
import 'package:test_bounty/screens/developers/create_campaign/create_campaign_wizard.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Campaigns')),
      body: const Center(
        child: Text(
          'Campaign List Coming Soon\nTap + to create one!',
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CreateCampaignWizard()),
        ),
        label: const Text('New Campaign'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
