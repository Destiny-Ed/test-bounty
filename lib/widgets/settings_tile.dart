import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';

Widget settingTile(
  BuildContext context,
  IconData icon,
  String title,
  VoidCallback onTap, {
  Widget? trailing,
  String? subtitle,
}) {
  return Card(
    elevation: 4,
    color: Theme.of(context).cardColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: EdgeInsets.only(bottom: 5),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
        child: Icon(icon, color: Theme.of(context).primaryColor),
      ),
      title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      subtitle: Text(
        (subtitle ?? "").capitalize,
        style: Theme.of(context).textTheme.titleSmall,
      ),

      trailing:
          trailing ??
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).textTheme.headlineMedium!.color,
          ),
      onTap: onTap,
    ),
  );
}
