// lib/screens/tester/campaign_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_bounty/core/constants.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/modals/submit_report_modal.dart';
import 'package:test_bounty/widgets/glass_container.dart';
import 'package:test_bounty/widgets/header_widget.dart';
import 'package:test_bounty/widgets/info_box.dart';
import 'package:test_bounty/widgets/social_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ActiveTestDetailScreen extends StatelessWidget {
  const ActiveTestDetailScreen({super.key});

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

                  buildHeaderTitle(context, text: "Download the App"),

                  downloadButton(
                    context,
                    icon: _getPlatformIcon(platform: 'ios'),
                    title: _getPlatformTitle(platform: 'ios'),
                    subtitle: 'v2.4.1 • 68 MB',
                    link: "buildLink",
                    color: _getPlatformColor(platform: 'ios'),
                  ),

                  buildHeaderTitle(context, text: "quick links"),
                  _copyLinkTile(
                    context,
                    'Google Play Internal',
                    "https://nottechat.com",
                  ),
                  buildHeaderTitle(
                    context,
                    text: "Final Check Before Submitting",
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      finaTesterCheckBeforeSubmitting.capitalize,
                      style: Theme.of(context).textTheme.titleMedium!
                        ..color?.darken(),
                    ),
                  ),

                  // JOIN BUTTON
                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "leave test",
                          onTap: () {
                            Navigator.pop(context);
                          },
                          bgColor: AppColors.red,
                        ),
                      ),
                      Expanded(
                        child: CustomButton(
                          text: "submit report",
                          onTap: () {
                            showSubmitTesterReportModel(context);
                          },
                        ),
                      ),
                    ],
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "High-quality reports gets approved quickly.".cap,
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

  Widget downloadButton(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String link,
    required Color color,
  }) {
    return Card(
      elevation: 8,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () =>
            launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, size: 36, color: color),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    Text(subtitle, style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.download, color: AppColors.primaryGreen),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _copyLinkTile(BuildContext context, String label, String url) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardColor,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading: Icon(Icons.link, color: Theme.of(context).primaryColor),
        title: Text(label, style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(url, style: Theme.of(context).textTheme.titleSmall),
        trailing: IconButton(
          icon: Icon(
            Icons.copy,
            color: Theme.of(context).textTheme.titleMedium!.color,
          ),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: url));
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('$label copied!')));
          },
        ),
      ),
    );
  }

  String _getPlatformTitle({required String platform}) {
    if (platform == "android") {
      return "Download APK (Android)";
    } else {
      return "Open in TestFlight (iOS)";
    }
  }

  IconData _getPlatformIcon({required String platform}) {
    if (platform == "android") {
      return Icons.android;
    } else {
      return Icons.apple;
    }
  }

  Color _getPlatformColor({required String platform}) {
    if (platform == "android") {
      return AppColors.green;
    } else {
      return AppColors.black;
    }
  }
}
