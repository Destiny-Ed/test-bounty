// lib/screens/tester/tester_profile_screen.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/widgets/activity_and_metric_card.dart';
import 'package:test_bounty/widgets/header_widget.dart';
import 'package:test_bounty/widgets/info_box.dart';
import 'package:test_bounty/widgets/settings_tile.dart';
import 'package:test_bounty/widgets/social_button.dart';

class TesterProfileScreen extends StatelessWidget {
  const TesterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile & Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                spacing: 10,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: CachedNetworkImageProvider(
                          'https://i.pravatar.cc/300',
                        ),
                        backgroundColor: Theme.of(context).cardColor,
                      ),
                      Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Michael Torres',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            'sarah@pixelcraft.studio',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          InfoBox(
                            color: AppColors.primaryGreen,
                            value: "Diamond Tester • Level 68",
                            textColor: AppColors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Rank Badge
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.yellow, AppColors.orange],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).cardColor,
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.diamond, size: 35, color: Colors.white),
                        5.height(),
                        Text(
                          'Diamond Rank',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          'Top 1% of all testers',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  5.height(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 16,
                    children: [
                      Expanded(
                        child: metricCard(
                          color: AppColors.green,
                          context: context,
                          title: 'Tests Done',
                          value: '245',
                          icon: Icons.check_circle,
                        ),
                      ),
                      Expanded(
                        child: metricCard(
                          context: context,
                          color: Theme.of(context).primaryColor,
                          title: 'Acceptance',
                          value: '99.2%',
                          icon: Icons.trending_up,
                        ),
                      ),
                      Expanded(
                        child: metricCard(
                          context: context,
                          color: AppColors.primaryGreen,
                          title: 'Total Earned',
                          value: '\$18,420',
                          icon: Icons.paid,
                        ),
                      ),
                    ],
                  ),
                  5.height(),

                  // Streak & Badges
                  Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.local_fire_department,
                            size: 40,
                            color: AppColors.orange,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              '42-day testing streak!'.capitalize,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Text(
                            'Hot!',
                            style: Theme.of(context).textTheme.headlineMedium!
                                .copyWith(color: AppColors.orange),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Settings
                  buildHeaderTitle(context, text: 'Account'),
                  settingTile(
                    context,
                    Icons.wallet,
                    'Payment Methods',
                    subtitle: 'PayPal • Crypto • Bank account',
                    () {},
                  ),
                  settingTile(
                    context,
                    Icons.history,
                    'Earnings History',
                    subtitle: '\$247 this month',
                    () {},
                  ),

                  // settingTile(
                  //   context,
                  //   Icons.card_giftcard,
                  //   'Redeem Gift Cards',
                  //   subtitle: 'Amazon, Apple, etc.',
                  //   () {},
                  // ),
                  const SizedBox(height: 20),
                  buildHeaderTitle(context, text: 'Preferences'),

                  settingTile(
                    context,
                    Icons.notifications,
                    'Push Notifications',
                    subtitle: 'All campaigns',
                    () {},
                  ),
                  settingTile(
                    context,
                    Icons.security,
                    'Privacy Settings',
                    subtitle: 'Public profile',
                    () {},
                  ),
                  settingTile(
                    context,
                    Icons.dark_mode,
                    'Dark Mode',
                    () {},
                    subtitle: "dark",
                    trailing: Switch(
                      value: true,
                      onChanged: (_) {},
                      activeThumbColor: AppColors.primaryGreen,
                    ),
                  ),
                  settingTile(
                    context,
                    Icons.language,
                    'Language',
                    subtitle: "English",
                    () {},
                    trailing: Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),

                  buildHeaderTitle(context, text: 'Support'),

                  settingTile(
                    context,
                    Icons.support,
                    'Help & Support',
                    subtitle: 'Get help 24/7',
                    () {},
                  ),
                  10.height(),
                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "delete account",
                          bgColor: AppColors.red,
                        ),
                      ),

                      Expanded(child: CustomButton(text: "sign out")),
                    ],
                  ),
                  30.height(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
