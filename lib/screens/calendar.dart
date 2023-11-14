import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/tasks.dart';
import '../models/task.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String pickedDate = DateFormat.yMMMd().format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Tasks provider = Provider.of<Tasks>(context);
    List<Task> todayTasks = provider.todayTask(pickedDate);
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                CalendarDatePicker(
                  initialDate: DateTime(2023),
                  firstDate: DateTime(2023),
                  lastDate: DateTime.now().add(const Duration(days: 100000)),
                  onDateChanged: (DateTime value) {
                    setState(() {
                      pickedDate = DateFormat.yMMMd().format(value);
                    });
                  },
                ),
                Text(pickedDate),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: todayTasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          todayTasks[index].completed
                              ? Icons.done
                              : Icons.timelapse,
                        ),
                        subtitle: Text(provider.tasks[index].description),
                        title: Text(todayTasks[index].taskName),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
