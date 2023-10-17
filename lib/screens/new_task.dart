import 'package:flutter/material.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task Name',
            style: theme.textTheme.bodyLarge,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Task Name',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Description',
            style: theme.textTheme.bodyLarge,
          ),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Description',
            ),
          ),
          Text(
            'Date',
            style: theme.textTheme.bodyLarge,
          ),
          TextField(
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today_outlined)),
              border: const OutlineInputBorder(),
              hintText: 'Enter Task Name',
            ),
          ),
        ],
      ),
    );
  }
}
