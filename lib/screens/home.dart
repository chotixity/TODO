import 'package:flutter/material.dart';
import 'package:todo_app/helpers/DBHelper.dart';

import '../widgets/tile.dart';
import '../provider/tasks.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final DBHelper _storage;
  final Tasks _tasks = Tasks();
  //double progress = 1 / 3;

  @override
  void initState() {
    _storage = DBHelper();
    _storage.opendatabase();
    _tasks.fetchTasks();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _storage.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Tasks>(context, listen: false);
    double progress = provider.completedTasks();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: provider.tasks.isEmpty
            ? const Center(
                child: Text('You have no tasks today  do something'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Joel!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TaskProgress(progress: progress),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today\'s tasks(${provider.tasks.length})',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See All',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: provider.tasks.length,
                      itemBuilder: ((context, index) {
                        return Tile(
                          title: provider.tasks[index].taskName,
                          description: provider.tasks[index].description,
                          //completedSessions: '0 / 3',
                          time:
                              '${provider.tasks[index].startTime.format(context)} - ${provider.tasks[index].endTime.format(context)}',
                        );
                      }),
                    ),
                  )
                ],
              ),
      ),
      //bottomNavigationBar: const BottomBar(),
    );
  }
}

class TaskProgress extends StatelessWidget {
  const TaskProgress({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<Tasks>(context);
    return Container(
      height: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              children: [
                Center(
                    child: Text(
                  '${(progress * 100).round()}%',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: theme.colorScheme.onPrimary),
                )),
                SizedBox(
                  height: 90,
                  width: 90,
                  child: CircularProgressIndicator(
                    //backgroundColor: theme.colorScheme.primary,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    value: progress,
                    strokeWidth: 10,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            child: FractionallySizedBox(
              //widthFactor: .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'You\'re almost halfway through your daily tasks',
                    style: theme.textTheme.displayMedium!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${provider.tasks.where((task) => task.completed == true).length} of ${provider.tasks.length} tasks completed',
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
