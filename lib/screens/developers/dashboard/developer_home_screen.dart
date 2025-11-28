import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/screens/developers/dashboard/bug_analysis_view.dart';
import 'package:test_bounty/screens/developers/profile/developer_profile_screen.dart';
import 'package:test_bounty/widgets/activity_and_metric_card.dart';

class DeveloperDashboard extends StatelessWidget {
  const DeveloperDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DeveloperProfileScreen()),
            );
          },
          child: Icon(Icons.person_2_rounded, size: 20),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    metricCard(
                      context: context,
                      title: 'Active Testers',
                      value: '127',
                      icon: Icons.people,
                    ),
                    metricCard(
                      context: context,
                      title: 'Critical Bugs',
                      value: '3',
                      icon: Icons.error,
                      color: Colors.red,
                    ),
                    metricCard(
                      context: context,
                      title: 'Total Spent',
                      value: '\$1,842',
                      icon: Icons.paid,
                    ),
                    metricCard(
                      context: context,
                      title: 'Total Campaign',
                      value: '50',
                      icon: Icons.attach_money,
                    ),
                  ],
                ),

                AnalysisView(),

                10.height(),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    'recent activity'.cap,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                10.height(),
                ...List.generate(4, (index) {
                  return activityTile(
                    context: context,
                    icon: Icons.bug_report,
                    color: AppColors.green,
                    title: "New bug 'UI Glitch'",
                    subtitle: "Reported by @destinyed",
                    time: "2m ago",
                  );
                }),

                10.height(),

                //
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: const Color(0xFF00D4B1),
      //   onPressed: () {},
      //   icon: const Icon(Icons.add),
      //   label: const Text('New Campaign'),
      // ),
    );
  }
}
