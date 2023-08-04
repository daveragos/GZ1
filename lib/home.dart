// ignore_for_file: prefer_const_constructors
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  int startIndex = 1;
  final screens = [
    AddingPage(),
    HomePage(),
    CalendarPage(),
  ];
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.add_card_rounded),
      Icon(Icons.gamepad_rounded),
      Icon(Icons.calendar_month_rounded),
    ];
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ]),
      resizeToAvoidBottomInset: false,
      body: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: screens[startIndex]),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.deepPurple,
        color: Colors.deepPurple.shade200,
        animationDuration: Duration(milliseconds: 300),
        onTap: (value) => setState(() {
          startIndex = value;
        }),
        index: startIndex,
        items: items,
      ),
    );
  }
}
