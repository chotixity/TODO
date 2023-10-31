import 'package:flutter/material.dart';
import 'package:todo_app/screens/new_task.dart';
import 'package:todo_app/screens/settings_final.dart';
import 'package:todo_app/screens/statistics.dart';
import '../screens/calendar.dart';
import '../screens/home.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final List<AppBar> _appbars = [
    AppBar(),
    AppBar(),
    AppBar(
      title: const Text('Add Task'),
    ),
    AppBar(),
    AppBar(),
  ];
  static const List<Widget> _widgetOptions = [
    Home(),
    Calendar(),
    NewTask(),
    Statistics(),
    SettingsFinal(),
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
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: _appbars.elementAt(_selectedIndex),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedItemColor: Colors.blue,
          items: _bars,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
