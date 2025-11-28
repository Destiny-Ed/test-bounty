import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/screens/developers/campaign/campaign_details_screen.dart';
import 'package:test_bounty/screens/developers/campaign/create_campaign/create_campaign_wizard.dart';
import 'package:test_bounty/widgets/info_box.dart';
import 'package:test_bounty/widgets/search_widget.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Campaigns'),
        automaticallyImplyLeading: false,
        actions: [
          // GestureDetector(
          //   onTap: () {
          //     //filter campaigns
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(10.0),
          //     child: CircleAvatar(
          //       backgroundColor: Theme.of(context).cardColor,
          //       foregroundColor: Theme.of(context).textTheme.titleMedium!.color,
          //       child: Icon(Icons.shuffle),
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreateCampaignWizard()),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: InfoBox(
                color: AppColors.primaryBlue,
                value: "Create Campaign",
                textColor: AppColors.white,
              ),
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
                spacing: 10,
                children: [
                  SearchWidget(title: "search for a campaign"),

                  ...List.generate(5, (index) {
                    return campaignTile(
                      context: context,
                      status: "live",
                      color: AppColors.green,
                      value: 50,
                    );
                  }),

                  60.height(),
                ],
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   foregroundColor: AppColors.white,
      //   onPressed: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (_) => const CreateCampaignWizard()),
      //   ),
      //   label: const Text('Create Campaign'),
      //   icon: const Icon(Icons.add),
      // ),
    );
  }
}

Widget campaignTile({
  required BuildContext context,
  required String status,
  required Color color,
  required double value,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CampaignDetailsScreen()),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("iOS", style: Theme.of(context).textTheme.titleMedium),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("iOS", style: Theme.of(context).textTheme.titleMedium),
          //     Icon(
          //       Icons.arrow_forward_ios,
          //       color: Theme.of(context).textTheme.titleMedium!.color,
          //       size: 14,
          //     ),
          //   ],
          // ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              "ChromaNote Ai".cap,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(
              "up to \$50",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).scaffoldBackgroundColor.darken(),
              ),
              width: 100,
              height: 50,
              child: Icon(Icons.tiktok),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                status.capitalize,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: color),
              ),
              Text(
                "5/10 testers submitted".capitalize,
                style: Theme.of(context).textTheme.titleMedium!
                  ..color!.darken(),
              ),
            ],
          ),
          Slider(
            padding: const EdgeInsets.all(0),
            value: value,
            activeColor: color,
            onChanged: (_) {},
            max: 100,
          ),
        ],
      ),
    ),
  );
}
