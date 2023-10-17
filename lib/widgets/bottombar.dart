import 'package:flutter/material.dart';
import 'package:todo_app/screens/new_task.dart';
import '../screens/settings.dart';
import '../screens/calendar.dart';
import '../screens/home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    Home(),
    Calendar(),
    NewTask(),
    Text('my name is choti'),
    SettingsPage(),
  ];
  final List<BottomNavigationBarItem> _bars = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.calendar_today),
      label: 'Calendar',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.add_circle,
        size: 50,
      ),
      label: 'new Task',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart),
      label: 'graph',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'settings',
    )
  ];

  void _onItemTapped(int Index) {
    setState(() {
      _selectedIndex = Index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor: Colors.blue,
        items: _bars,
        onTap: _onItemTapped,
      ),
    );
  }
}
