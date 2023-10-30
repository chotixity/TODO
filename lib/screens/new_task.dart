import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

enum Type {
  Study,
  Other,
  Work,
  Personal,
}

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final DateTime _pickedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Name',
                  style: theme.textTheme.bodyLarge,
                ),
                TextField(
                  controller: _taskNameController,
                  decoration: const InputDecoration(
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
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
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
                  keyboardType: TextInputType.none,
                  controller: _dateController,
                  onTap: () {
                    showDatePicker(
                      keyboardType: const TextInputType.numberWithOptions(),
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2030),
                    ).then((value) {
                      final date = DateFormat.yMMMd().format(value!);
                      setState(() {
                        _dateController.text = date;
                      });
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.calendar_today_outlined)),
                    border: const OutlineInputBorder(),
                    hintText: '',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Time',
                  style: theme.textTheme.bodyLarge,
                ),
                TextField(
                  controller: _timeController,
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    ).then((value) {
                      print(value!.format(context));
                      setState(() {
                        _timeController.text = value.format(context);
                      });
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_time)),
                    border: const OutlineInputBorder(),
                    hintText: 'pick Time',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Type',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                DropdownMenu(
                  initialSelection: Type.Other,
                  controller: _typeController,
                  width: MediaQuery.of(context).size.width * .9,
                  dropdownMenuEntries: const <DropdownMenuEntry>[
                    DropdownMenuEntry(value: Type.Other, label: 'Other'),
                    DropdownMenuEntry(value: Type.Work, label: 'Work'),
                    DropdownMenuEntry(value: Type.Study, label: 'Study'),
                    DropdownMenuEntry(value: Type.Personal, label: 'Personal')
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll<Size>(
                      Size(MediaQuery.of(context).size.width * .9, 50),
                    ),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        theme.colorScheme.secondary),
                  ),
                  onPressed: () {
                    //Tasks.addNewTask();
                  },
                  child: Text(
                    'SAVE',
                    style: theme.textTheme.bodyMedium,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
