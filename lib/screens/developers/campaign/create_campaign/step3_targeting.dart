// lib/screens/developer/create_campaign/step3_targeting.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/modals/multi_item_list_modal.dart';
import 'package:test_bounty/modals/single_item_list_modal.dart';
import 'package:test_bounty/providers/campaign_provider.dart';

class Step3Targeting extends StatelessWidget {
  const Step3Targeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CampaignProvider>(
      builder: (context, campaign, child) {
        return Column(
          children: [
            ListTile(
              title: Text(
                'Platform',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              trailing: Text(
                'Android',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ListTile(
              title: Text(
                'OS Version',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                showSingleItemPickerBottomSheet(
                  context: context,
                  items: ["ios 11", "ios 12", "ios 17", "ios 26"],
                  currentSelected: "ios 11",
                  onItemSelected: (item) {
                    campaign.selectedCampaignDeviceVersion = item;
                  },
                );
              },
              trailing: Text(
                '${campaign.selectedCampaignDeviceVersion.isEmpty ? "select version" : campaign.selectedCampaignDeviceVersion} ▼'
                    .capitalize
                    .capitalize,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ListTile(
              title: Text(
                'Countries',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                showMultiPickerBottomSheet(
                  context: context,
                  items: campaign.campaignCountries,
                  initiallySelected: campaign.selectedCampaignCountries,
                  title: "select countries",
                  onItemsSelected: (items) {
                    campaign.selectedCampaignCountries = items;
                  },
                );
              },
              trailing: Text(
                '${campaign.selectedCampaignCountries.isEmpty ? "select countries" : campaign.selectedCampaignCountries.first}... ▼'
                    .capitalize,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            SwitchListTile(
              inactiveTrackColor: Theme.of(context).cardColor,
              title: Text(
                'Phone only',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              value: campaign.phoneOnly,
              onChanged: (value) {
                campaign.phoneOnly = value;
              },
            ),
            ListTile(
              title: Text(
                'Allowed age range',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              onTap: () {
                showMultiPickerBottomSheet(
                  context: context,
                  items: campaign.campaignAges
                      .map((e) => e.toString())
                      .toList(),
                  initiallySelected: campaign.selectedCampaignAges
                      .map((e) => e.toString())
                      .toList(),
                  title: "select ages",
                  onItemsSelected: (items) {
                    campaign.selectedCampaignAges = items
                        .map((e) => int.tryParse(e) ?? 0)
                        .toList();
                  },
                );
              },
              trailing: Text(
                '${campaign.selectedCampaignAges.isEmpty ? "select countries" : campaign.selectedCampaignAges.first}... ▼'
                    .capitalize,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            40.height(),
          ],
        );
      },
    );
  }
}
