// lib/screens/developer/create_campaign/step2_build_upload.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/core/theme.dart';
import 'package:test_bounty/core/utils.dart';
import 'package:test_bounty/widgets/form_field.dart';

class Step2BuildUpload extends StatelessWidget {
  const Step2BuildUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor.darken(),
              width: 3,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).cardColor,
          ),
          child: Column(
            children: [
              Icon(
                Icons.cloud_upload,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
              20.height(),
              Text(
                'Drop APK / IPA here',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'or click to browse',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              20.height(),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith(
                    (_) => AppColors.primaryGreen,
                  ),
                ),
                onPressed: () {
                  pickDocument().then((value) {
                    log("picked file : $value");
                  });
                },
                icon: Icon(
                  Icons.attach_file,
                  color: Theme.of(context).textTheme.titleSmall!.color,
                ),
                label: Text(
                  'Choose File',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
        ),
        30.height(),
        Text(
          'OR paste TestFlight / Google Play link',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        CustomTextField(hint: "https://...", password: false),
        40.height(),
      ],
    );
  }
}
