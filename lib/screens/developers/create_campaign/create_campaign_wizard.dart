// lib/screens/developer/create_campaign/create_campaign_wizard.dart
import 'package:flutter/material.dart';
import 'step1_basic_info.dart';
import 'step2_build_upload.dart';
import 'step3_targeting.dart';
import 'step4_testers_schedule.dart';
import 'step5_rewards_budget.dart';
import 'step6_questionnaire.dart';
import 'step7_review_launch.dart';

class CreateCampaignWizard extends StatefulWidget {
  const CreateCampaignWizard({super.key});

  @override
  State<CreateCampaignWizard> createState() => _CreateCampaignWizardState();
}

class _CreateCampaignWizardState extends State<CreateCampaignWizard> {
  int currentStep = 0;
  final PageController _controller = PageController();

  final List<Widget> steps = const [
    Step1BasicInfo(),
    Step2BuildUpload(),
    Step3Targeting(),
    Step4TestersSchedule(),
    Step5RewardsBudget(),
    Step6Questionnaire(),
    Step7ReviewLaunch(),
  ];

  void next() {
    if (currentStep < steps.length - 1) {
      setState(() => currentStep++);
      _controller.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
    }
  }

  void back() {
    if (currentStep > 0) {
      setState(() => currentStep--);
      _controller.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.ease);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Campaign'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ],
      ),
      body: Column(
        children: [
          // Progress Indicator
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: List.generate(steps.length, (i) => Expanded(
                child: Container(
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: i <= currentStep ? const Color(0xFF00D4B1) : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              )),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: steps.map((s) => _StepWrapper(
                child: s,
                stepNumber: steps.indexOf(s) + 1,
                isLast: steps.indexOf(s) == steps.length - 1,
                onNext: next,
                onBack: back,
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _StepWrapper extends StatelessWidget {
  final Widget child;
  final int stepNumber;
  final bool isLast;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const _StepWrapper({
    required this.child,
    required this.stepNumber,
    required this.isLast,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: const Color(0xFF0066FF), child: Text('$stepNumber', style: const TextStyle(color: Colors.white))),
              const SizedBox(width: 12),
              Text('Step $stepNumber', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 30),
          Expanded(child: child),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (stepNumber > 1)
                TextButton(onPressed: onBack, child: const Text('Back')),
              ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D4B1),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text(isLast ? 'Launch Campaign' : 'Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}