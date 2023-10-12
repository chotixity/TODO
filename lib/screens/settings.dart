import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _focusSessionExpanded = false;
  final bool _timeExpanded = false;
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
          Flexible(
            child: ListView(
              children: [
                focusSessions(theme),
                const Divider(),
                Container(
                  height: _timeExpanded ? 100 : 80,
                  decoration: const BoxDecoration(color: Colors.black26),
                  child: ListTile(
                    title: Text(
                      'Time',
                      style: theme.textTheme.displayMedium,
                    ),
                    leading: const Icon(
                      Icons.timer_outlined,
                      size: 40,
                    ),
                  ),
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

class customTile extends StatelessWidget {
  final IconData icon;
  final String title;
  const customTile(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(
        icon,
        size: 40,
      ),
      title: Text(
        title,
        style: theme.textTheme.displayMedium,
      ),
    );
  }
}
