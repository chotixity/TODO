import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String title;
  final String description;
  final String completedSessions;
  final String time;
  const Tile({
    super.key,
    required this.title,
    required this.description,
    required this.completedSessions,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Theme.of(context).colorScheme.secondary,
      height: 150,
      child: Card(
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: .995,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          description,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        completedSessions.toString(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      Text(
                        time,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      )
                    ],
                  ),
                ),
              ),
              FractionallySizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        showBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 300,
                              child: Column(
                                children: [
                                  const ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('Edit Task'),
                                  ),
                                  const ListTile(
                                    leading: Icon(Icons.edit_calendar),
                                    title: Text('Push to Tomorrow'),
                                  ),
                                  const ListTile(
                                    leading: Icon(Icons.done),
                                    title: Text('Mark as Completed'),
                                  ),
                                  const ListTile(
                                    leading: Icon(Icons.delete),
                                    title: Text('Delete Task'),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const ListTile(
                                      leading: Icon(Icons.cancel),
                                      title: Text('cancel'),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.more_vert,
                        size: 40,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_circle,
                        size: 40,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
