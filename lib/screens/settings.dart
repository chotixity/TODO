import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _timeController = TextEditingController();
  bool _focusSessionExpanded = false;
  bool _timeExpanded = false;
  bool _autoStartBreaks = false;
  bool _autoStartSessions = false;

  void _toggleExpanded() {
    setState(() {
      _focusSessionExpanded = !_focusSessionExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: theme.textTheme.displayMedium,
          ),
          Expanded(
            child: ListView(
              children: [
                focusSessions(theme),
                const Divider(),
                Time(theme, context),
                Container(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container Time(ThemeData theme, BuildContext context) {
    return Container(
      height: _timeExpanded ? 120 : 80,
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Time',
              style: theme.textTheme.displayMedium,
            ),
            leading: const Icon(
              Icons.timer_outlined,
              size: 40,
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  _timeExpanded = !_timeExpanded;
                });
              },
              icon: Icon(
                _timeExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 50,
              ),
            ),
          ),
          if (_timeExpanded)
            ListTile(
              leading: Text(
                'Hour format',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: DropdownMenu<String>(
                controller: _timeController,
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
    );
  }

  Container focusSessions(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      height: _focusSessionExpanded ? 200 : 80,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.hourglass_empty,
              size: 40,
            ),
            title: Text(
              'Focus Sessions',
              style: theme.textTheme.displayMedium,
            ),
            trailing: IconButton(
              onPressed: () {
                _toggleExpanded();
              },
              icon: Icon(
                _focusSessionExpanded
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
                size: 50,
              ),
            ),
          ),
          if (_focusSessionExpanded)
            SwitchListTile(
              activeColor: Colors.green,
              //secondary: const Icon(Icons.hourglass_empty),
              title: const Text('Auto Start Breaks'),
              value: _autoStartBreaks,
              onChanged: (bool value) {
                setState(() {
                  _autoStartBreaks = value;
                });
              },
            ),
          if (_focusSessionExpanded)
            SwitchListTile(
              activeColor: Colors.green,
              //secondary: const Icon(Icons.hourglass_empty),
              title: const Text('Auto Start Sessions'),
              value: _autoStartSessions,
              onChanged: (bool value) {
                setState(
                  () {
                    _autoStartSessions = value;
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
