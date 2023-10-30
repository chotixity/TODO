import 'package:flutter/material.dart';

class SettingsFinal extends StatefulWidget {
  const SettingsFinal({super.key});

  @override
  State<SettingsFinal> createState() => _SettingsFinalState();
}

class _SettingsFinalState extends State<SettingsFinal> {
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _sessiontime = TextEditingController();
  final TextEditingController _shortBreak = TextEditingController();
  final TextEditingController _longBreak = TextEditingController();
  bool _autoStartBreaks = false;
  bool _autoStartSessions = false;
  bool _toggleReminders = true;
  final List<bool> _isExpanded = List.filled(4, false);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  _isExpanded[panelIndex] = !_isExpanded[panelIndex];
                });
              },
              elevation: 3,
              materialGapSize: 20,
              expandIconColor: Colors.black,
              children: [
                ExpansionPanel(
                  canTapOnHeader: true,
                  //backgroundColor: Theme.of(context).colorScheme.primary,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      leading: const Icon(Icons.hourglass_empty),
                      title: Text(
                        'focus Sessions',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  },
                  body: Column(
                    children: [
                      SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Session',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextField(
                                    controller: _sessiontime,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Short Break',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextField(
                                    controller: _shortBreak,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Long Break',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  TextField(
                                    controller: _longBreak,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SwitchListTile(
                        title: const Text('AutoStart Breaks'),
                        value: _autoStartBreaks,
                        onChanged: (value) {
                          setState(() {
                            _autoStartBreaks = value;
                          });
                        },
                      ),
                      SwitchListTile(
                        title: const Text('AutoStart Sessions'),
                        value: _autoStartSessions,
                        onChanged: (value) {
                          setState(() {
                            _autoStartSessions = value;
                          });
                        },
                      ),
                    ],
                  ),
                  isExpanded: _isExpanded[0],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  //backgroundColor: Theme.of(context).colorScheme.primary,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      leading: const Icon(Icons.timer),
                      title: Text(
                        'Time',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  },
                  body: Column(
                    children: [
                      ListTile(
                        //leading: Icon(Icons.timer_10),
                        title: const Text('Hour Format'),
                        trailing: DropdownMenu<String>(
                          controller: _timeController,
                          initialSelection: '24 Hour',
                          dropdownMenuEntries: const [
                            DropdownMenuEntry<String>(
                              value: '24 Hour',
                              label: '24 Hour',
                            ),
                            DropdownMenuEntry(
                              value: '12 Hour',
                              label: '12 Hour',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  isExpanded: _isExpanded[1],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  //backgroundColor: Theme.of(contex,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      leading: const Icon(Icons.brightness_7_sharp),
                      title: Text(
                        'Theme',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  },
                  body: const Column(
                    children: [
                      ListTile(
                        //leading: Icon(Icons.timer_10),
                        title: Text('Hello darkness'),
                        trailing: Icon(Icons.delete),
                      )
                    ],
                  ),
                  isExpanded: _isExpanded[2],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  //backgroundColor: Theme.of(context).colorScheme.primary,
                  headerBuilder: (context, isExpanded) {
                    return ListTile(
                      leading: const Icon(Icons.notifications),
                      title: Text(
                        'Notifications',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    );
                  },
                  body: SwitchListTile.adaptive(
                    title: const Text('Reminders'),
                    value: _toggleReminders,
                    onChanged: (value) {
                      setState(() {
                        _toggleReminders = value;
                      });
                    },
                  ),
                  isExpanded: _isExpanded[3],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
