import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/providers/reports_provider.dart';
import 'package:test_bounty/screens/developers/campaign/tab_pages/reports/report_details_screen.dart';
import 'package:test_bounty/widgets/info_box.dart';

class CampaignReportView extends StatefulWidget {
  final CampaignProvider campaignVm;
  const CampaignReportView({super.key, required this.campaignVm});

  @override
  State<CampaignReportView> createState() => _CampaignReportViewState();
}

class _CampaignReportViewState extends State<CampaignReportView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportDetailsScreen()),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              children: [
                ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.all(0),
                  leading: CircleAvatar(),
                  title: Text(
                    "John Doe".cap,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.star, color: AppColors.yellow, size: 12),
                      Text(
                        "4.8".cap,
                        style: Theme.of(context).textTheme.titleSmall!
                          ..color?.darken(),
                      ),
                    ],
                  ),
                  trailing: Text(
                    "2 min ago",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),

                ListTile(
                  dense: true,
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    "fatal crash on profile save".capitalize,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    "app crashes consistently when trying to save profile information after editing the bio. Seems to be an issue with handling long text strings"
                        .capitalize,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall!
                      ..color?.darken(),
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    runSpacing: 5,
                    spacing: 10,
                    children: [
                      InfoBox(color: AppColors.red, value: "crash"),
                      InfoBox(color: AppColors.green, value: "feature request"),
                      InfoBox(color: AppColors.primaryBlue, value: "UI glitch"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
