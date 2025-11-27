import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/widgets/header_widget.dart';
import 'package:test_bounty/widgets/info_box.dart';
import 'package:test_bounty/widgets/info_horizontal_tile.dart';
import 'package:test_bounty/widgets/social_button.dart';

class ReportDetailsScreen extends StatefulWidget {
  const ReportDetailsScreen({super.key});

  @override
  State<ReportDetailsScreen> createState() => _ReportDetailsScreenState();
}

class _ReportDetailsScreenState extends State<ReportDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI Freeze on profile edit".cap)),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                spacing: 15,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      runSpacing: 5,
                      spacing: 10,
                      children: [
                        InfoBox(color: AppColors.red, value: "crash"),
                        InfoBox(
                          color: AppColors.green,
                          value: "feature request",
                        ),
                        InfoBox(
                          color: AppColors.primaryBlue,
                          value: "UI glitch",
                        ),
                        InfoBox(
                          color: Theme.of(context).cardColor,
                          value: "IOS",
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Video Player View",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),

                  //Show video here
                  buildHeaderTitle(context, text: "screenshots (4)"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 10,
                      children: List.generate(5, (index) {
                        return Container(
                          width: 100,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "screenshots",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      spacing: 10,
                      children: [
                        buildHeaderTitle(context, text: "device/app info"),

                        buildInfoHorizontalTile(
                          context,
                          title: "app version",
                          value: "1.0.0(2)",
                        ),
                        buildInfoHorizontalTile(
                          context,
                          title: "device model",
                          value: "iphone 15 pro",
                        ),
                        buildInfoHorizontalTile(
                          context,
                          title: "os version",
                          value: "iOS 26.1",
                        ),
                        buildInfoHorizontalTile(
                          context,
                          title: "battery",
                          value: "25%",
                        ),
                        buildInfoHorizontalTile(
                          context,
                          title: "carrier",
                          value: "MTN",
                        ),
                        buildInfoHorizontalTile(
                          context,
                          title: "time zone",
                          value: "eastern standard time",
                        ),
                        buildInfoHorizontalTile(
                          context,
                          title: "locale",
                          value: "english (Nigeria)",
                        ),
                        buildInfoHorizontalTile(
                          context,
                          title: "architecture",
                          value: "arm64e",
                        ),
                        buildInfoHorizontalTile(
                          context,
                          title: "connection type",
                          value: "cellular",
                        ),
                        buildInfoHorizontalTile(
                          context,
                          title: "screen resolution",
                          value: "393 x 852 pts",
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      spacing: 10,
                      children: [
                        buildHeaderTitle(context, text: "description"),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "app crashes consistently when trying to save profile information after editing the bio. Seems to be an issue with handling long text strings"
                                    .capitalize *
                                4,
                            style: Theme.of(context).textTheme.titleSmall!
                              ..color?.darken(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      spacing: 10,
                      children: [
                        buildHeaderTitle(context, text: "reproduction steps"),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """
1. Navigate to the 'profile' tab

2. Tap the 'Edit Profile' button.

3. Change any field (e.g, username)

4. Tap the 'Save Changes' button

5. Observe the UI freeze
                  """
                                .capitalize,

                            style: Theme.of(context).textTheme.titleSmall!
                              ..color?.darken()
                              ..copyWith(letterSpacing: 2),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      spacing: 10,
                      children: [
                        buildHeaderTitle(context, text: "reporter"),

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
                              Icon(
                                Icons.star,
                                color: AppColors.yellow,
                                size: 12,
                              ),
                              Text(
                                "4.8 rating".cap,
                                style: Theme.of(context).textTheme.titleSmall!
                                  ..color?.darken(),
                              ),
                            ],
                          ),
                          trailing: TextButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateColor.resolveWith(
                                (state) => Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "send email".cap,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: "Reject",
                          onTap: () {},
                          bgColor: Theme.of(context).cardColor,
                        ),
                      ),
                      Expanded(
                        child: CustomButton(text: "Approve", onTap: () {}),
                      ),
                    ],
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
