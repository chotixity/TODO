import 'package:flutter/material.dart';

import '../widgets/bottombar.dart';
import '../widgets/tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double progress = 1 / 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Hello, Joel!',
              style: Theme.of(context).textTheme.displayMedium,
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
                  'Today\'s tasks(9)',
                  style: Theme.of(context).textTheme.headlineMedium,
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
              child: ListView(
                children: const [
                  Tile(
                    title: 'Dondaa Enhancements',
                    description: 'Bug fixes and improvements',
                    completedSessions: '0 / 3',
                    time: '11:00 - 13 -10',
                  ),
                  Tile(
                    title: 'Dondaa Enhancements',
                    description:
                        'Bug fixes and improvements on the UI of my app in production',
                    completedSessions: '0 / 3',
                    time: '11:00 - 13 -10',
                  ),
                  Tile(
                    title: 'Research about ios SDK',
                    description:
                        'How it works and a sample project illustrating how to use it for a video feature',
                    completedSessions: '1 / 3',
                    time: '11:00 - 13 -10',
                  )
                ],
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
                  style: Theme.of(context).textTheme.displayMedium,
                )),
                SizedBox(
                  height: 90,
                  width: 90,
                  child: CircularProgressIndicator(
                    backgroundColor: theme.colorScheme.primary,
                    color: Colors.white,
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
                    style: theme.textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '3 of 9 tasks completed',
                    style: theme.textTheme.bodyMedium,
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
