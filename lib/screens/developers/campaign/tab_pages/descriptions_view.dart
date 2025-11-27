import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/providers/campaign_provider.dart';
import 'package:test_bounty/widgets/header_widget.dart';
import 'package:test_bounty/widgets/info_vertical_card.dart';

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
    return Column(
      spacing: 10,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            spacing: 10,
            children: [
              buildHeaderTitle(context, text: "about this campaign"),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "join us in testing the next generation of personal finance management."
                          .capitalize *
                      5,
                  style: Theme.of(context).textTheme.titleMedium!
                    ..color?.darken(),
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            spacing: 10,
            children: [
              buildHeaderTitle(context, text: "requirements"),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "join us in testing the next generation of personal finance management."
                          .capitalize *
                      5,
                  style: Theme.of(context).textTheme.titleMedium!
                    ..color?.darken(),
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment : CrossAxisAlignment.start,
            spacing: 10,
            children: [
              buildHeaderTitle(context, text: "reward"),
              buildInfoVerticalCard(
                context,
                title: "total reward",
                value: "\$100",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
