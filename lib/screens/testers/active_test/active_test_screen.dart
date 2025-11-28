// lib/screens/tester/active_tests_screen.dart
import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/screens/testers/active_test/active_test_details_screen.dart';

class ActiveTestsScreen extends StatelessWidget {
  const ActiveTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Active Tests'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Theme.of(context).cardColor,
            margin: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
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
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.sports_esports,
                        color: AppColors.white,
                        size: 32,
                      ),
                    ),
                    title: Text(
                      'DocQuiz Ai'.cap,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    subtitle: Text(
                      'Ends in 4 days',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    trailing: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ActiveTestDetailScreen(),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      child: Text(
                        'Continue'.capitalize,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Slider(
                    padding: const EdgeInsets.all(0),
                    value: 0.6,
                    onChanged: (_) {},
                    thumbColor: AppColors.primaryGreen,
                    activeColor: AppColors.primaryGreen,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '60% completed',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
