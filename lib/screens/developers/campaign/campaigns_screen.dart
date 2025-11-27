import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/screens/developers/create_campaign/create_campaign_wizard.dart';

class CampaignsScreen extends StatelessWidget {
  const CampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Campaigns'),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              //filter campaigns
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).cardColor,
                foregroundColor: Theme.of(context).textTheme.titleMedium!.color,
                child: Icon(Icons.shuffle),
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
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: Theme.of(
                            context,
                          ).textTheme.titleLarge!.color!.darken(),
                        ),
                        isDense: true,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "search for a campaign...".capitalize,
                        hintStyle: TextStyle(
                          color: Theme.of(
                            context,
                          ).textTheme.titleLarge!.color!.darken(),
                        ),
                      ),
                    ),
                  ),

                  ...List.generate(5, (index) {
                    return campaignTile(
                      context: context,
                      status: "live",
                      color: AppColors.green,
                      value: 50
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CreateCampaignWizard()),
        ),
        label: const Text('Create Campaign'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

Widget campaignTile({
  required BuildContext context,
  required String status,
  required Color color,
  required double value,
}) {
  return Container(
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
          trailing: CircleAvatar(
            backgroundColor: AppColors.yellow,
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
              "5/10 tasks complete".capitalize,
              style: Theme.of(context).textTheme.titleMedium!..color!.darken(),
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
  );
}
