import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';

class InfoBox extends StatelessWidget {
  final Color color;
  final Color? textColor;
  final String value;
  const InfoBox({
    super.key,
    required this.color,
    required this.value,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: textColor != null ? color : color.lighten(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        value.cap,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: textColor ?? color.darken()),
      ),
    );
  }
}
