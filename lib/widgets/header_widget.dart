import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';

Widget buildHeaderTitle(BuildContext context, {required String text}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      text.cap,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.left,
    ),
  );
}