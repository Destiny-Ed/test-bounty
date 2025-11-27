import 'package:flutter/material.dart';
import 'package:test_bounty/providers/campaign_provider.dart';

class CampaignTestersView extends StatefulWidget {
  final CampaignProvider campaignVm;
  const CampaignTestersView({super.key, required this.campaignVm});

  @override
  State<CampaignTestersView> createState() => _CampaignTestersViewState();
}

class _CampaignTestersViewState extends State<CampaignTestersView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
