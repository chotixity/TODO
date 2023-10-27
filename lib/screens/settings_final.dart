import 'package:flutter/material.dart';

class SettingsFinal extends StatefulWidget {
  const SettingsFinal({super.key});

  @override
  State<SettingsFinal> createState() => _SettingsFinalState();
}

class _SettingsFinalState extends State<SettingsFinal> {
  bool _autoStartBreaks = false;
  final List<bool> _isExpanded = List.filled(5, false);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            _isExpanded[panelIndex] = !_isExpanded[panelIndex];
          });
        },
        expandIconColor: Colors.black,
        children: [
          ExpansionPanel(
            backgroundColor: Theme.of(context).colorScheme.primary,
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
            backgroundColor: Theme.of(context).colorScheme.primary,
            headerBuilder: (context, isExpanded) {
              return Text(
                'focus Sessions',
                style: Theme.of(context).textTheme.displayMedium,
              );
            },
            body: const Column(
              children: [
                ListTile(
                  title: Text('Hello darkness'),
                  trailing: Icon(Icons.delete),
                )
              ],
            ),
            isExpanded: _isExpanded[1],
          ),
        ],
      ),
    );
  }
}
