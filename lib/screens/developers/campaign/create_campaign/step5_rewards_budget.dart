// lib/screens/developer/create_campaign/step5_rewards_budget.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/providers/campaign_provider.dart';
import 'package:test_bounty/widgets/glass_container.dart';
import 'package:test_bounty/widgets/header_widget.dart';
import 'package:test_bounty/widgets/info_box.dart';

class Step5RewardsBudget extends StatelessWidget {
  const Step5RewardsBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CampaignProvider>(
      builder: (context, campaignVm, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rewards & budget'.cap,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            10.height(),
            Text(
              "set your budget and how much you'll reward each tester."
                  .capitalize,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            20.height(),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                spacing: 10,
                children: [
                  buildHeaderTitle(context, text: 'reward per tester'),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              campaignVm.updateCampaignRewardPerTester(false),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Theme.of(context).cardColor,
                            child: Icon(Icons.remove),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "\$${campaignVm.campaignRewardPerTester}",
                            style: Theme.of(context).textTheme.headlineLarge,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              campaignVm.updateCampaignRewardPerTester(true),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Theme.of(context).cardColor,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Text(
                  //   'You pay: \$${campaignVm.campaignRewardPerTester + (campaignVm.campaignRewardPerTester * (5 / 100))} -> Tester gets: \$${campaignVm.campaignRewardPerTester}',
                  // style: Theme.of(
                  //   context,
                  // ).textTheme.titleMedium?.copyWith(color: AppColors.green),
                  // ),
                ],
              ),
            ),

            20.height(),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Budget',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      GlassContainer(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "\$${campaignVm.totalCampaignPayment}",
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(color: AppColors.primaryBlue),
                        ),
                      ),
                    ],
                  ),
                  10.height(),
                  Text(
                    'You pay \$${(campaignVm.totalCampaignPayment)} → Testers get \$${campaignVm.campaignRewardPerTester} each (10% platform fee)',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: AppColors.green),
                  ),
                  40.height(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
