import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/providers/campaign_provider.dart';

class Step8ReviewLaunch extends StatefulWidget {
  const Step8ReviewLaunch({super.key});

  @override
  State<Step8ReviewLaunch> createState() => _Step8ReviewLaunchState();
}

class _Step8ReviewLaunchState extends State<Step8ReviewLaunch> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 4),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  // void _launchCampaign() {
  //   _confettiController.play();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text('Campaign launched successfully!'),
  //       backgroundColor: Colors.green,
  //       duration: Duration(seconds: 3),
  //     ),
  //   );
  //   Future.delayed(const Duration(seconds: 3), () {
  //     Navigator.popUntil(context, (route) => route.isFirst);
  //   });
  // }

  void _editStep(CampaignProvider vm, int stepIndex) {
    vm.goToPage(stepIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Consumer<CampaignProvider>(
          builder: (context, campaignVm, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Review & Launch',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                10.height(),
                Text(
                  'Everything looks perfect!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                20.height(),

                _SummaryCard(
                  step: 1,
                  title: 'Basic Info',

                  content: ["FoodRush Delivery", "v2.4.1 (Build 89)"],
                  icon: Icons.info_outline,
                  onEdit: () => _editStep(campaignVm, 0),
                ),
                _SummaryCard(
                  step: 2,
                  title: 'Build',
                  content: ["APK uploaded (68 MB)", "com.foodrush.app"],

                  icon: Icons.android,
                  onEdit: () => _editStep(campaignVm, 1),
                ),
                _SummaryCard(
                  step: 3,
                  title: 'Targeting',
                  content: [
                    "Worldwide",
                    "English",
                    "Spanish",
                    "Phone + Tablet",
                  ],

                  icon: Icons.public,
                  onEdit: () => _editStep(campaignVm, 2),
                ),
                _SummaryCard(
                  step: 4,
                  title: 'Testers & Schedule',
                  content: [
                    "150 testers needed",
                    "7 days duration",
                    "Start immediately",
                  ],

                  icon: Icons.schedule,
                  onEdit: () => _editStep(campaignVm, 3),
                ),
                _SummaryCard(
                  step: 5,
                  title: 'Rewards & Budget',
                  content: [
                    "12.00 per tester",
                    "Total payout: \$1,800",
                    "Platform fee: \$360",
                    "You pay: \$2,160",
                  ],

                  icon: Icons.paid,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00D4B1), Color(0xFF0066FF)],
                  ),
                  onEdit: () => _editStep(campaignVm, 4),
                ),
                _SummaryCard(
                  step: 6,
                  title: 'Test Plan',
                  content: [
                    "Screen recording required (≥60s)",
                    "3+ annotated screenshots",
                    "Test signup, booking, payment flow",
                  ],
                  icon: Icons.task_alt,
                  onEdit: () => _editStep(campaignVm, 5),
                ),
                _SummaryCard(
                  step: 7,
                  title: 'Questionnaire',
                  content: [
                    "3 questions added",
                    "Overall rating",
                    "What did you like?",
                    " What frustrated you?",
                  ],
                  icon: Icons.quiz,
                  onEdit: () => _editStep(campaignVm, 6),
                ),

                const SizedBox(height: 20),
              ],
            );
          },
        ),

        // Confetti
        ConfettiWidget(
          confettiController: _confettiController,
          blastDirectionality: BlastDirectionality.explosive,
          emissionFrequency: 0.05,
          numberOfParticles: 50,
          gravity: 0.2,
        ),
      ],
    );
  }
}

// Reusable Summary Card
class _SummaryCard extends StatelessWidget {
  final int step;
  final String title;
  final List<String> content;
  final IconData icon;
  final LinearGradient? gradient;
  final VoidCallback onEdit;

  const _SummaryCard({
    required this.step,
    required this.title,
    required this.content,
    required this.icon,
    this.gradient,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CircleAvatar(
            //   radius: 20,
            //   backgroundColor: gradient != null
            //       ? Theme.of(
            //           context,
            //         ).textTheme.titleMedium!.color!.withOpacity(0.3)
            //       : Theme.of(context).primaryColor,
            //   child: Text(
            //     '$step',
            //     style: TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 15,
            //       color: gradient != null
            //           ? Theme.of(context).textTheme.titleMedium!.color
            //           : Theme.of(context).textTheme.titleMedium!.color,
            //     ),
            //   ),
            // ),
            // 12.width(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        color: gradient != null
                            ? Theme.of(context).textTheme.titleMedium!.color
                            : Theme.of(context).primaryColor,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium!,
                      ),
                    ],
                  ),
                  8.height(),
                  ...List.generate(content.length, (index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        content[index],
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).textTheme.titleMedium!.color,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
            TextButton.icon(
              onPressed: onEdit,
              icon: const Icon(Icons.edit, size: 15),
              label: const Text('Edit'),
              style: TextButton.styleFrom(
                foregroundColor: gradient != null
                    ? Theme.of(context).textTheme.titleMedium!.color
                    : Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
