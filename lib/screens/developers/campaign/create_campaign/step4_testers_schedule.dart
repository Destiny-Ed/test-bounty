// lib/screens/developer/create_campaign/step4_testers_schedule.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/modals/single_item_list_modal.dart';
import 'package:test_bounty/providers/campaign_provider.dart';

class Step4TestersSchedule extends StatelessWidget {
  const Step4TestersSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CampaignProvider>(
      builder: (context, campaignVm, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number of testers needed'.cap,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            10.height(),
            Text(
              campaignVm.numberOfCampaignTesters.toInt().toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            10.height(),
            Slider(
              padding: const EdgeInsets.all(0),
              value: campaignVm.numberOfCampaignTesters.toDouble(),
              min: 5,
              max: 1000,
              label: campaignVm.numberOfCampaignTesters.toInt().toString(),
              onChanged: (value) {
                campaignVm.numberOfCampaignTesters = value.toInt();
              },
            ),

            30.height(),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                'Test Duration',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              onTap: () {
                showSingleItemPickerBottomSheet(
                  context: context,
                  items: campaignVm.campaignTestDuration,
                  currentSelected: campaignVm.selectedCampaignTestDuration,
                  onItemSelected: (value) {
                    campaignVm.selectedCampaignTestDuration = value;
                  },
                );
              },
              trailing: Text(
                '${campaignVm.selectedCampaignTestDuration} ▼',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SwitchListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                'Start immediately',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              value: true,
              onChanged: (_) {},
            ),

            60.height(),
          ],
        );
      },
    );
  }
}
