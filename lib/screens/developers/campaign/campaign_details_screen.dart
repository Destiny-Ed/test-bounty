import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/providers/campaign_provider.dart';
import 'package:test_bounty/screens/developers/campaign/tab_pages/descriptions_view.dart';
import 'package:test_bounty/screens/developers/campaign/tab_pages/reports/reports_view.dart';
import 'package:test_bounty/screens/developers/campaign/tab_pages/testers_view.dart';
import 'package:test_bounty/widgets/info_box.dart';
import 'package:test_bounty/widgets/info_vertical_card.dart';
import 'package:test_bounty/widgets/search_widget.dart';

class CampaignDetailsScreen extends StatefulWidget {
  const CampaignDetailsScreen({super.key});

  @override
  State<CampaignDetailsScreen> createState() => _CampaignDetailsScreenState();
}

class _CampaignDetailsScreenState extends State<CampaignDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CampaignProvider>(
      builder: (context, campaignVm, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("ChromeNote Ai"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        campaignVm.setCampaignPauseStatus();
                      },
                      icon: Icon(
                        campaignVm.isCampaignPause
                            ? Icons.play_arrow
                            : Icons.pause,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ///TODO: Export reports
                        print("export reports");
                      },
                      child: InfoBox(
                        color: AppColors.primaryBlue,
                        textColor: AppColors.white,
                        value: "Export Reports",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          InfoBox(
                            color: AppColors.lightBlue,
                            value: "Live campaign",
                          ),

                          Text(
                            "ends in 2 days".capitalize,
                            style: Theme.of(context).textTheme.titleMedium!
                              ..color?.darken(),
                          ),
                        ],
                      ),
                      if (campaignVm.selectedCampaignTab != "description")
                        SearchWidget(title: "search for testers"),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 20,
                          children: [
                            buildInfoVerticalCard(
                              context,
                              title: "active testers",
                              value: "142",
                            ),
                            buildInfoVerticalCard(
                              context,
                              title: "submitted reports",
                              value: "42",
                            ),
                            buildInfoVerticalCard(
                              context,
                              title: "reward per tester",
                              value: "\$10",
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            campaignVm.campaignDetailTabs.length,
                            (index) {
                              final tab = campaignVm.campaignDetailTabs[index];
                              final isSelected =
                                  tab == campaignVm.selectedCampaignTab;
                              return Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    campaignVm.selectedCampaignTab = tab;
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 400),
                                    padding: const EdgeInsets.all(10),
                                    decoration: isSelected
                                        ? BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            color: Theme.of(
                                              context,
                                            ).secondaryHeaderColor,
                                          )
                                        : null,
                                    child: Text(
                                      tab.cap,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      _campaignTabPages(campaignVm),
                      10.height(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _campaignTabPages(CampaignProvider campaignVm) {
    switch (campaignVm.selectedCampaignTab) {
      case "description":
        return CampaignDescriptionsView(campaignVm: campaignVm);
      case "reports":
        return CampaignReportView(campaignVm: campaignVm);
      case "testers":
      default:
        return CampaignTestersView(campaignVm: campaignVm);
    }
  }
}
