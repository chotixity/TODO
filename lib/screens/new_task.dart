import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key});

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final DateTime _pickedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: SingleChildScrollView(
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
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                ).then((value) {
                  setState(() {
                    _dateController.text = value!.toString();
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
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_time)),
                border: const OutlineInputBorder(),
                hintText: 'pick Time',
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
    );
  }
}
