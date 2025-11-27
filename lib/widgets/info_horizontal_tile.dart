import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';

Widget buildInfoHorizontalTile(
  BuildContext context, {
  required String title,
  required String value,
}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.cap,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          value.cap,
          style: Theme.of(context).textTheme.titleSmall!..color?.darken(),
        ),
      ],
    ),
  );
}
