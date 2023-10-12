import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
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
          ),
          SizedBox(
            height: 100,
            child: Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                separatorBuilder: (context, index) {
                  return const VerticalDivider(
                    width: 20,
                    //color: Colors.amber,
                  );
                },
                itemBuilder: (context, index) {
                  return const DaysTile();
                },
              ),
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
    return Container(
      //height: 30,
      width: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black26,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(DateFormat.E().format(DateTime.now()))],
      ),
    );
  }
}
