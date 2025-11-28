// lib/screens/tester/campaign_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:test_bounty/core/constants.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/widgets/glass_container.dart';
import 'package:test_bounty/widgets/header_widget.dart';
import 'package:test_bounty/widgets/info_box.dart';
import 'package:test_bounty/widgets/social_button.dart';

class TesterCampaignDetailScreen extends StatelessWidget {
  const TesterCampaignDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final requirements = [
      'Android 13+',
      'US, UK, CA',
      "18+ age",
      "Phone only",
      'Screen Record',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Mega App"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlassContainer(
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(0),
                      leading: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context).primaryColor,
                              AppColors.primaryGreen,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.delivery_dining,
                          color: AppColors.white,
                          size: 32,
                        ),
                      ),
                      title: Text(
                        "Project Phoenix".cap,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        "from Stack Industries".cap,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),

                      trailing: InfoBox(
                        color: Theme.of(context).primaryColor,
                        value: "\$50",
                        textColor: AppColors.white,
                      ),
                    ),
                  ),

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

                  buildHeaderTitle(context, text: "test instruction"),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '1. Sign up with a new account\n'
                      '2. Complete onboarding\n'
                      '3. Browse restaurants and order food\n'
                      '4. Apply promo code TEST20\n'
                      '5. Complete checkout with test card\n'
                      '6. Rate your experience',
                      style: Theme.of(context).textTheme.titleMedium!
                        ..color?.darken(),
                    ),
                  ),

                  buildHeaderTitle(context, text: "requirements"),

                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: requirements
                        .map(
                          (tag) => Chip(
                            label: Text(
                              tag,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            backgroundColor: Theme.of(context).cardColor,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                          ),
                        )
                        .toList(),
                  ),

                  buildHeaderTitle(context, text: "Please Read Before Joining"),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      infoForTesters.capitalize,
                      style: Theme.of(context).textTheme.titleMedium!
                        ..color?.darken(),
                    ),
                  ),

                  // JOIN BUTTON
                  CustomButton(
                    text: "join now",
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Successfully joined!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "you'll receive \$50 after approval".cap,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(color: AppColors.green),
                    ),
                  ),
                  20.height(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
