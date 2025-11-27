import 'package:flutter/material.dart';
import 'package:test_bounty/providers/reports_provider.dart';

class CampaignDescriptionsView extends StatefulWidget {
  final CampaignProvider campaignVm;

  const CampaignDescriptionsView({super.key, required this.campaignVm});

  @override
  State<CampaignDescriptionsView> createState() =>
      _CampaignDescriptionsViewState();
}

class _CampaignDescriptionsViewState extends State<CampaignDescriptionsView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
