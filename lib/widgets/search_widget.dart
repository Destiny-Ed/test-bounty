import 'package:flutter/material.dart';
import 'package:test_bounty/core/extensions.dart';

class SearchWidget extends StatelessWidget {
  final String title;
  const SearchWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        readOnly: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 20,
            color: Theme.of(context).textTheme.titleLarge!.color!.darken(),
          ),
          isDense: true,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "$title...".capitalize,
          hintStyle: TextStyle(
            color: Theme.of(context).textTheme.titleLarge!.color!.darken(),
          ),
        ),
      ),
    );
  }
}
