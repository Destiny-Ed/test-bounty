import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/providers/campaign_provider.dart';

class CreateCampaignWizard extends StatefulWidget {
  const CreateCampaignWizard({super.key});

  @override
  State<CreateCampaignWizard> createState() => _CreateCampaignWizardState();
}

class _CreateCampaignWizardState extends State<CreateCampaignWizard> {
  @override
  void initState() {
    super.initState();
    context.read<CampaignProvider>().currentCampaignStep = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CampaignProvider>(
      builder: (context, campaignVm, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create Campaign'),
            elevation: 0,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              // Progress Indicator
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: List.generate(
                    campaignVm.steps.length,
                    (i) => Expanded(
                      child: Container(
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: i <= campaignVm.currentCampaignStep
                              ? AppColors.primaryGreen
                              : Theme.of(context).secondaryHeaderColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: campaignVm.campaignStepController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: campaignVm.steps
                      .map(
                        (s) => _StepWrapper(
                          stepNumber: campaignVm.steps.indexOf(s) + 1,
                          isLast:
                              campaignVm.steps.indexOf(s) ==
                              campaignVm.steps.length - 1,
                          onNext: campaignVm.next,
                          onBack: campaignVm.back,
                          child: s,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    '$stepNumber',
                    style: const TextStyle(color: AppColors.white),
                  ),
                ),
                12.width(),

                Text(
                  'Step $stepNumber',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            30.height(),
            child,
            20.height(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (stepNumber > 1)
                  TextButton(
                    onPressed: onBack,
                    child: Text(
                      'Back',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryGreen,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    isLast ? 'Launch Campaign' : 'Next',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            20.height(),
          ],
        ),
      ),
    );
  }
}
