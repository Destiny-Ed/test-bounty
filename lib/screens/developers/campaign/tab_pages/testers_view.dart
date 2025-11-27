import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/providers/campaign_provider.dart';

class CampaignTestersView extends StatefulWidget {
  final CampaignProvider campaignVm;
  const CampaignTestersView({super.key, required this.campaignVm});

  @override
  State<CampaignTestersView> createState() => _CampaignTestersViewState();
}

class _CampaignTestersViewState extends State<CampaignTestersView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(10, (index) {
        return ListTile(
          dense: true,
          contentPadding: const EdgeInsets.all(0),
          leading: CircleAvatar(),
          title: Text(
            "John Doe".cap,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: IntrinsicHeight(
            child: Row(
              children: [
                Icon(Icons.star, color: AppColors.yellow, size: 12),
                Text(
                  "4.8 rating".cap,
                  style: Theme.of(context).textTheme.titleSmall!
                    ..color?.darken(),
                ),
                VerticalDivider(),
                Text(
                  "joined 3 hrs ago".capitalize,
                  style: Theme.of(context).textTheme.titleSmall!
                    ..color?.darken(),
                ),
              ],
            ),
          ),
          trailing: TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateColor.resolveWith(
                (state) => Theme.of(context).primaryColor,
              ),
            ),
            onPressed: () {},
            child: Text(
              "view profile".cap,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        );
      }),
    );
  }
}
