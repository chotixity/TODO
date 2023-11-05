import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/provider/tasks.dart';

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
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  int _counter = 0;

  void _addMinutes() {
    const session = 25;
    var newHour = selectedTime.hour;
    num minutes = _counter * session + selectedTime.minute;
    int newMinute = selectedTime.minute + minutes as int;

    // If the sum of minutes exceeds 59, adjust the hour and minute
    if (newMinute >= 60) {
      newHour += newMinute ~/ 60;
      newMinute %= 60;
    }

    final updatedTime = TimeOfDay(hour: newHour, minute: newMinute);

    setState(() {
      endTime = updatedTime;
    });
  }

  //final hour  = _timeController.text.split(':').elementAt(0);
  //void endTime = TimeOfDay(hour: _timeController.text.split(':'), minute: minute)

  @override
  Widget build(BuildContext context) {
    final tasks = Tasks();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                height: 5,
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
                height: 5,
              ),
              Text(
                'Date',
                style: theme.textTheme.bodyLarge,
              ),
              TextField(
                keyboardType: TextInputType.none,
                controller: _dateController,
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    keyboardType: const TextInputType.numberWithOptions(),
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );

                  setState(() {
                    _dateController.text =
                        DateFormat.yMd().format(selectedDate!);
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
                height: 5,
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
                height: 20,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          const Text('Start Time'),
                          InkWell(
                            onTap: () async {
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
                                initialEntryMode: TimePickerEntryMode.input,
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                              if (pickedTime != null &&
                                  pickedTime != selectedTime) {
                                setState(() {
                                  selectedTime = pickedTime;
                                });
                              }
                              _addMinutes();
                            },
                            child: Text(
                              selectedTime == TimeOfDay.now()
                                  ? TimeOfDay.now().format(context)
                                  : selectedTime.format(context),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: const Divider(
                        color: Colors.black,
                        height: 15,
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          const Text('End Time'),
                          Text(
                            _counter == 0 || selectedTime == TimeOfDay.now()
                                ? TimeOfDay.now().format(context)
                                : endTime.format(context),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Focus Sessions',
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _counter > 0 ? _counter-- : 0;
                        });
                        _addMinutes();
                      },
                      icon: const Icon(Icons.minimize_outlined),
                    ),
                    Text(
                      '$_counter',
                      style: const TextStyle(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _counter++;
                        });
                        _addMinutes();
                      },
                      icon: const Icon(Icons.add),
                    )
                  ],
                ),
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
                  tasks.addNewTask(
                    Task(
                      _taskNameController.text,
                      _descriptionController.text,
                      DateFormat('yMd').parse(_dateController.text),
                      _typeController.text,
                      selectedTime,
                      endTime,
                      false,
                    ),
                  );
                  _taskNameController.text = '';
                  _descriptionController.text = '';
                  _dateController.text = '';
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
    );
  }
}
