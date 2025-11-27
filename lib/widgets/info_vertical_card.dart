import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';

Widget buildInfoVerticalCard(
  BuildContext context, {
  required String title,
  required String value,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Theme.of(context).cardColor,
    ),
    child: Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.cap, style: Theme.of(context).textTheme.titleSmall),
        Text(value, style: Theme.of(context).textTheme.headlineMedium),
      ],
    ),
  );
}
