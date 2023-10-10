import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Calendar',
                  style: theme.textTheme.displayMedium,
                ),
                Text(
                  DateFormat.yMMM().format(DateTime.now()),
                  style: theme.textTheme.displayMedium,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DaysTile extends StatelessWidget {
  const DaysTile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 100,
      child: Column(
        children: [],
      ),
    );
  }
}
