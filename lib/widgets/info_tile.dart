import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';

Widget buildInfoTile(
  BuildContext context, {
  required String title,
  required String value,
}) {
  return ListTile(
    dense: true,
    contentPadding: const EdgeInsets.all(0),
    title: Text(
      title.cap,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleLarge,
    ),
    subtitle: Text(
      value.cap,
      style: Theme.of(context).textTheme.titleSmall!..color?.darken(),
    ),
  );
}
