import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String title;
  final String description;
  final String completedSessions;
  final String time;
  const Tile(
      {super.key,
      required this.title,
      required this.description,
      required this.completedSessions,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
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
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        description,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(completedSessions.toString()),
                      Text(time)
                    ],
                  ),
                ),
              ),
              FractionallySizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.more_vert,
                      size: 40,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.play_circle,
                        size: 40,
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