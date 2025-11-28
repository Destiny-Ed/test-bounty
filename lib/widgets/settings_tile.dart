import 'package:flutter/material.dart';

Widget settingTile(
  BuildContext context,
  IconData icon,
  String title,
  VoidCallback onTap, {
  Widget? trailing,
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
