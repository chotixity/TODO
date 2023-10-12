import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _expanded = false;
  bool _autoStartBreaks = false;
  bool _autoStartSessions = false;

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
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
          Flexible(
            child: ListView(
              children: [
                focusSessions(theme),
                Container(
                  height: ,
                  decoration: const BoxDecoration(color: Colors.black26),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container focusSessions(ThemeData theme) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black26),
      height: _expanded ? 200 : 80,
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
                _expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                size: 50,
              ),
            ),
          ),
          if (_expanded)
            SwitchListTile(
              //secondary: const Icon(Icons.hourglass_empty),
              title: const Text('Auto Start Breaks'),
              value: _autoStartBreaks,
              onChanged: (bool value) {
                setState(() {
                  _autoStartBreaks = value;
                });
              },
            ),
          if (_expanded)
            SwitchListTile(
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
