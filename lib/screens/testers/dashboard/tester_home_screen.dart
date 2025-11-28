// lib/screens/tester/tester_home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/providers/tester_dashboard_provider.dart';
import 'package:test_bounty/screens/testers/dashboard/campaign_details.dart';
import 'package:test_bounty/widgets/info_box.dart';

class TesterHomeScreen extends StatefulWidget {
  const TesterHomeScreen({super.key});
  @override
  State<TesterHomeScreen> createState() => _TesterHomeScreenState();
}

class _TesterHomeScreenState extends State<TesterHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Tests'),
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Consumer<TesterDashboardProvider>(
        builder: (context, testerVm, child) {
          return Column(
            spacing: 10,
            children: [
              // Filter Chips
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: testerVm.filters.length,
                  itemBuilder: (context, i) {
                    final filter = testerVm.filters[i].toLowerCase();
                    final isSelected = testerVm.selectedFilter == filter;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ChoiceChip(
                        label: Text(
                          filter.cap,
                          style: TextStyle(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (_) => testerVm.selectedFilter = filter,
                        selectedColor: Theme.of(context).primaryColor,
                        backgroundColor: Theme.of(context).cardColor,
                        labelStyle: TextStyle(color: AppColors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Campaign List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return CampaignCard(
                      title: 'FoodRush – Food Delivery App',
                      subtitle: "from Stack Industries",
                      reward: '\$14.00',
                      spotsLeft: 38,
                      totalSpots: 150,
                      timeLeft: '2 days left',
                      tags: ['Android 13+', 'US, UK, CA', 'Screen Record'],
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CampaignDetailScreen(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// Reusable Campaign Card
class CampaignCard extends StatelessWidget {
  final String title, reward, timeLeft, subtitle;
  final int spotsLeft, totalSpots;
  final List<String> tags;
  final VoidCallback onTap;

  const CampaignCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.reward,
    required this.spotsLeft,
    required this.totalSpots,
    required this.timeLeft,
    required this.tags,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(bottom: 10),
      color: Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
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
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(Icons.fastfood, color: AppColors.white, size: 32),
                ),
                title: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  subtitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 10,
                  children: [
                    Text(
                      reward,
                      style: Theme.of(context).textTheme.headlineMedium!
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      '$spotsLeft/$totalSpots spots',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(),
                    ),
                  ],
                ),
                onTap: onTap,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: [
                    Chip(
                      label: Text(
                        "2 days left",
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.white,
                        ),
                      ),
                      backgroundColor: AppColors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    ),
                    ...tags.map(
                      (tag) => Chip(
                        label: Text(tag, style: const TextStyle(fontSize: 11)),
                        backgroundColor: Colors.grey[100],
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
