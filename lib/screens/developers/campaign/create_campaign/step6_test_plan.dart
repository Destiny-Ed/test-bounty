import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';

class Step6TestPlan extends StatelessWidget {
  const Step6TestPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detailed Test Instructions',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          10.height(),
          TextFormField(
            maxLines: 8,
            decoration: InputDecoration(
              hintText:
                  'Write clear step-by-step instructions...\n\nExample:\n1. Register with a new account\n2. Complete onboarding flow\n3. Try to book a ride\n4. Test payment with test card 4242 4242 4242 4242\n5. Rate the driver\n6. Check profile settings',
              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).textTheme.titleMedium!.color!.darken(),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              fillColor: Theme.of(context).cardColor,
            ),
          ),
          30.height(),
          // Text(
          //   'Key Flows to Test (check all that apply)',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
          // _checkboxTile('Sign up / Login'),
          // _checkboxTile('Onboarding tutorial'),
          // _checkboxTile('Main user journey'),
          // _checkboxTile('Payments / Checkout'),
          // _checkboxTile('Settings & Profile'),
          // _checkboxTile('Push notifications'),
          // _checkboxTile('Offline mode'),
          // _checkboxTile('Dark mode'),
          // SizedBox(height: 20),
          SwitchListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              'Require testers to record screen (minimum 60 seconds)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            value: true,
            onChanged: (_) {},
            activeThumbColor: AppColors.primaryGreen,
          ),
          SwitchListTile(
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              'Require at least 3 annotated screenshots',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            value: true,
            onChanged: (_) {},
            activeColor: AppColors.primaryGreen,
          ),
          20.height(),
        ],
      ),
    );
  }

  Widget _checkboxTile(String title, BuildContext context) => CheckboxListTile(
    title: Text(title),
    value: true,
    onChanged: (_) {},
    activeColor: AppColors.primaryGreen,
    controlAffinity: ListTileControlAffinity.leading,
  );
}
