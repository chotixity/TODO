import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double progress = 0.1;
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
            taskProgress(progress: progress),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Today\'s tasks(9)'),
                TextButton(onPressed: () {}, child: const Text('see all'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class taskProgress extends StatelessWidget {
  const taskProgress({
    super.key,
    required this.progress,
  });

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: Colors.white,
              value: progress,
              strokeWidth: 10,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          const Flexible(
            child: FractionallySizedBox(
              //widthFactor: .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'You\'re almost halfway through your daily tasks',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '3 of 9 tasks completed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
