import 'package:flutter/material.dart';

import '../screens/screens.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({required this.currentTab, super.key});
  final int currentTab;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

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
        //appBar: _appbars.elementAt(_selectedIndex),
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget.currentTab,
          unselectedItemColor: Theme.of(context).colorScheme.secondary,
          selectedItemColor: Colors.blue,
          items: _bars,
          onTap: _onItemTapped,
          // onTap: (index) {
          //   Provider.of<AppStateManager>(context, listen: false).gotoTab(index);
          //   print(index);
          //   context.goNamed(
          //     'home',
          //     pathParameters: {
          //       'tab': '$index',
          //     },
          //   );
          // },
        ),
      ),
    );
  }
}
