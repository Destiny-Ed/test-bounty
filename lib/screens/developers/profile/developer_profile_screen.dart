// lib/screens/developer/developer_profile_screen.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/widgets/activity_and_metric_card.dart';
import 'package:test_bounty/widgets/header_widget.dart';
import 'package:test_bounty/widgets/info_box.dart';
import 'package:test_bounty/widgets/settings_tile.dart';
import 'package:test_bounty/widgets/social_button.dart';

class DeveloperProfileScreen extends StatelessWidget {
  const DeveloperProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile & Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              // Profile Header
              Column(
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
                            'Sarah Chen',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            'sarah@pixelcraft.studio',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          InfoBox(
                            color: AppColors.primaryGreen,
                            value: "Pro Developer • Verified",
                            textColor: AppColors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              10.height(),

              // Stats Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 16,
                children: [
                  Expanded(
                    child: metricCard(
                      color: Theme.of(context).primaryColor,
                      context: context,
                      title: 'Campaigns',
                      value: '24',
                      icon: Icons.campaign,
                    ),
                  ),
                  Expanded(
                    child: metricCard(
                      context: context,
                      color: Theme.of(context).primaryColor,
                      title: 'Testers Reached',
                      value: '3,842',
                      icon: Icons.people,
                    ),
                  ),
                  Expanded(
                    child: metricCard(
                      context: context,
                      color: Theme.of(context).primaryColor,
                      title: 'Total Spent',
                      value: '\$18,420',
                      icon: Icons.paid,
                    ),
                  ),
                ],
              ),

              Divider(height: 20),

              // Settings Sections
              buildHeaderTitle(context, text: 'Account'),
              settingTile(
                context,
                Icons.person_outline,
                'Personal Information',
                () {},
              ),
              settingTile(context, Icons.security, 'Security & Login', () {}),

              buildHeaderTitle(context, text: 'Preferences'),

              settingTile(
                context,
                Icons.notifications_outlined,
                'Notifications',
                () {},
              ),
              settingTile(
                context,
                Icons.dark_mode,
                'Dark Mode',
                () {},
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
                () {},
                trailing: Text(
                  'English',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              buildHeaderTitle(context, text: 'Support'),
              settingTile(context, Icons.help_outline, 'Help Center', () {}),
              settingTile(context, Icons.shield, 'Privacy Policy', () {}),
              settingTile(
                context,
                Icons.description,
                'Terms of Service',
                () {},
              ),
              settingTile(context, Icons.share, 'Invite user', () {}),
              settingTile(context, Icons.rate_review, 'Review', () {}),
              settingTile(context, Icons.info, 'About', () {}),

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
    );
  }
}
