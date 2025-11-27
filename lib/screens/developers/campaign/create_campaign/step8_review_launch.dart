import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

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

  void _launchCampaign() {
    _confettiController.play();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Campaign launched successfully!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
      ),
    );
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.popUntil(context, (route) => route.isFirst);
    });
  }

  void _editStep(int stepIndex) {
    // Navigate back to wizard and jump to specific step
    Navigator.pop(context, stepIndex); // Return the target step index
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            children: [
              const Icon(
                Icons.rocket_launch,
                size: 100,
                color: Color(0xFF00D4B1),
              ),
              const Text(
                'Review & Launch',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Everything looks perfect!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              Expanded(
                child: ListView(
                  children: [
                    _SummaryCard(
                      step: 1,
                      title: 'Basic Info',
                      content: 'FoodRush Delivery\nv2.4.1 (Build 89)',
                      icon: Icons.info_outline,
                      onEdit: () => _editStep(0),
                    ),
                    _SummaryCard(
                      step: 2,
                      title: 'Build',
                      content: 'APK uploaded (68 MB)\ncom.foodrush.app',
                      icon: Icons.android,
                      onEdit: () => _editStep(1),
                    ),
                    _SummaryCard(
                      step: 3,
                      title: 'Targeting',
                      content:
                          'Worldwide\nEnglish, Spanish, French\nPhone + Tablet',
                      icon: Icons.public,
                      onEdit: () => _editStep(2),
                    ),
                    _SummaryCard(
                      step: 4,
                      title: 'Testers & Schedule',
                      content:
                          '150 testers needed\n7 days duration\nStart immediately',
                      icon: Icons.schedule,
                      onEdit: () => _editStep(3),
                    ),
                    _SummaryCard(
                      step: 5,
                      title: 'Rewards & Budget',
                      content:
                          '\$12.00 per tester\nTotal payout: \$1,800\nPlatform fee: \$360\nYou pay: \$2,160',
                      icon: Icons.paid,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF00D4B1), Color(0xFF0066FF)],
                      ),
                      onEdit: () => _editStep(4),
                    ),
                    _SummaryCard(
                      step: 6,
                      title: 'Test Plan',
                      content:
                          '• Screen recording required (≥60s)\n• 3+ annotated screenshots\n• Test signup, booking, payment flow',
                      icon: Icons.task_alt,
                      onEdit: () => _editStep(5),
                    ),
                    _SummaryCard(
                      step: 7,
                      title: 'Questionnaire',
                      content:
                          '3 questions added\n• Overall rating\n• What did you like?\n• What frustrated you?',
                      icon: Icons.quiz,
                      onEdit: () => _editStep(6),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _launchCampaign,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4B1),
                  minimumSize: const Size(double.infinity, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 12,
                ),
                child: const Text(
                  'LAUNCH CAMPAIGN NOW',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
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
  final String content;
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: gradient != null
                    ? Colors.white.withOpacity(0.3)
                    : const Color(0xFF0066FF),
                child: Text(
                  '$step',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: gradient != null ? Colors.white : Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          icon,
                          color: gradient != null
                              ? Colors.white
                              : const Color(0xFF0066FF),
                          size: 28,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: gradient != null
                                ? Colors.white
                                : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      content,
                      style: TextStyle(
                        fontSize: 15,
                        color: gradient != null
                            ? Colors.white70
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: onEdit,
                icon: const Icon(Icons.edit, size: 20),
                label: const Text('Edit'),
                style: TextButton.styleFrom(
                  foregroundColor: gradient != null
                      ? Colors.white
                      : const Color(0xFF0066FF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
