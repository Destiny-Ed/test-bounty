import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/widgets/header_widget.dart';
import 'package:test_bounty/widgets/social_button.dart';

class DevWalletScreen extends StatelessWidget {
  const DevWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    '\$5,420.00',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.copyWith(fontSize: 44),
                  ),
                ),
              ),
              5.height(),
              CustomButton(text: "add funds"),

              buildHeaderTitle(context, text: "invoice history"),

              ...List.generate(19, (index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                    leading: CircleAvatar(
                      backgroundColor: AppColors.green.lighten(),
                      foregroundColor: AppColors.green.darken(),
                      child: Icon(Icons.wallet),
                    ),
                    title: Text(
                      "wallet funded".cap,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      "may 15, 2025".capitalize,
                      style: Theme.of(context).textTheme.titleSmall!
                        ..color?.darken(),
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$250".capitalize,
                          style: Theme.of(context).textTheme.titleLarge!,
                        ),
                        Text(
                          "pending".capitalize,
                          style: Theme.of(context).textTheme.titleSmall!
                              .copyWith(color: AppColors.primaryGreen),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
