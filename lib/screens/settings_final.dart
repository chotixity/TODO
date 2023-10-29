import 'package:flutter/material.dart';

class SettingsFinal extends StatefulWidget {
  const SettingsFinal({super.key});

  @override
  State<SettingsFinal> createState() => _SettingsFinalState();
}

class _SettingsFinalState extends State<SettingsFinal> {
  final TextEditingController _timeController = TextEditingController();
  bool _autoStartBreaks = false;
  bool _toggleReminders = true;
  final List<bool> _isExpanded = List.filled(4, false);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Text(
              'Settings',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 50,
            ),
            ExpansionPanelList(
              expansionCallback: (panelIndex, isExpanded) {
                setState(() {
                  _isExpanded[panelIndex] = !_isExpanded[panelIndex];
                });
              },
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
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    );
                  },
                  body: Column(
                    children: [
                      const ListTile(
                        title: Text('Hello darkness'),
                        trailing: Icon(Icons.delete),
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
                    ],
                  ),
                  isExpanded: _isExpanded[0],
                ),
                ExpansionPanel(
                  canTapOnHeader: true,
                  //backgroundColor: Theme.of(context).colorScheme.primary,
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                      leading: Icon(Icons.timer),
                      title: Text('Time'),
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
                    return const ListTile(
                      leading: Icon(Icons.brightness_7_sharp),
                      title: Text('Theme'),
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
                    return const ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'),
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
