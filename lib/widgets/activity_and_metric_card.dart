import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';

Widget metricCard({
  required BuildContext context,
  required String title,
  required String value,
  required IconData icon,
  Color? color,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: color?.withOpacity(0.1) ?? Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: color?.darken() ?? Theme.of(context).primaryColor.darken(),
        width: 2,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: color ?? Theme.of(context).primaryColor),
        10.height(),
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(fontSize: 20),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!..color?.darken(),
        ),
      ],
    ),
  );
}

Widget activityTile({
  required BuildContext context,
  required IconData icon,
  required Color color,
  required String title,
  required String subtitle,
  required String time,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Theme.of(context).cardColor,
    ),
    child: ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color.withOpacity(0.1),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title.capitalize,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      subtitle: Text(
        subtitle.capitalize,
        style: Theme.of(context).textTheme.titleMedium!..color!.darken(),
      ),
      trailing: Text(
        time.capitalize,
        style: Theme.of(context).textTheme.titleMedium!..color!.darken(),
      ),
    ),
  );
}
