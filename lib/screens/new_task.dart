import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../provider/tasks.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
            height: 20,
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
          const SizedBox(
            height: 20,
          ),
          Text(
            'Date',
            style: theme.textTheme.bodyLarge,
          ),
          TextField(
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2030),
              );
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today_outlined)),
              border: const OutlineInputBorder(),
              hintText: DateFormat().add_yMMMd().format(DateTime.now()),
            ),
          ),
          const SizedBox(
            height: 20,
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
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStatePropertyAll<Size>(
                Size(MediaQuery.of(context).size.width * .9, 50),
              ),
              backgroundColor:
                  MaterialStatePropertyAll<Color>(theme.colorScheme.secondary),
            ),
            onPressed: () {
              Tasks.addNewTask();
            },
            child: Text(
              'SAVE',
              style: theme.textTheme.bodyMedium,
            ),
          )
        ],
      ),
    );
  }
}
