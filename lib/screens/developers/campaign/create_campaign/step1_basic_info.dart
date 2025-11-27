// lib/screens/developer/create_campaign/step1_basic_info.dart
import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';
import 'package:test_bounty/widgets/form_field.dart';
import 'package:test_bounty/widgets/header_widget.dart';

class Step1BasicInfo extends StatelessWidget {
  const Step1BasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Basic Info', style: Theme.of(context).textTheme.headlineLarge),
        10.height(),
        Text(
          'set up the core details for your new testing campaign'.capitalize,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        20.height(),
        CustomTextField(password: false, hint: "campaign name (internal)"),
        20.height(),
        CustomTextField(password: false, hint: "Public App Name"),
        20.height(),
        buildHeaderTitle(context, text: "app icon"),
        10.height(),
        Container(
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).textTheme.titleLarge!.color!,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
          ),
        ),
        20.height(),

        TextFormField(
          maxLines: 5,
          minLines: 3,
          decoration: InputDecoration(
            labelText: 'Short Description for Testers'.cap,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
