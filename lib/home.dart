import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'screens/adding_page.dart';
import 'screens/calendar_page.dart';
import 'screens/home_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int start_index = 1;
  final screens = [
    AddingPage(),
    HomePage(),
    CalendarPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.add_card_rounded),
      Icon(Icons.gamepad_rounded),
      Icon(Icons.calendar_month_rounded),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        color: Colors.deepPurple.shade200,
        animationDuration: Duration(milliseconds: 300),
        onTap: (value) => setState(() {
          start_index = value;
        }),
        index: start_index,
        items: items,
      ),
      body: screens[start_index],
    );
  }
}
