import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/screens/developers/dashboard/bug_analysis_view.dart';

class DeveloperDashboard extends StatelessWidget {
  const DeveloperDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: Icon(Icons.person_2_rounded, size: 20),
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
                    _metricCard(
                      context: context,
                      title: 'Active Testers',
                      value: '127',
                      icon: Icons.people,
                    ),
                    _metricCard(
                      context: context,
                      title: 'Critical Bugs',
                      value: '3',
                      icon: Icons.error,
                      color: Colors.red,
                    ),
                    _metricCard(
                      context: context,
                      title: 'Total Spent',
                      value: '\$1,842',
                      icon: Icons.paid,
                    ),
                    _metricCard(
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
                  return _activityTile(
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

  Widget _metricCard({
    required BuildContext context,
    required String title,
    required String value,
    required IconData icon,
    Color? color,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color?.withOpacity(0.1) ?? Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: color?.darken() ?? Theme.of(context).primaryColor.darken(),
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color ?? Theme.of(context).primaryColor),
          10.height(),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(fontSize: 20),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!..color?.darken(),
          ),
        ],
      ),
    );
  }
}

Widget _activityTile({
  required BuildContext context,
  required IconData icon,
  required Color color,
  required String title,
  required String subtitle,
  required String time,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).cardColor,
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color.withOpacity(0.1),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title.capitalize,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      subtitle: Text(
        subtitle.capitalize,
        style: Theme.of(context).textTheme.titleMedium!..color!.darken(),
      ),
      trailing: Text(
        time.capitalize,
        style: Theme.of(context).textTheme.titleMedium!..color!.darken(),
      ),
    ),
  );
}
