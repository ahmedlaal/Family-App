import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:newfamly/parents/activity.dart';
import 'package:newfamly/parents/geofence.dart';
import 'package:newfamly/parents/more_screen.dart';
import 'package:unicons/unicons.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selected = 0;
  List<Widget> pages = [
    const Activity(),
    const GeoFence(),
    const MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selected],
      bottomNavigationBar: SafeArea(
        child: GNav(
          padding: EdgeInsets.all(14),
          tabMargin: const EdgeInsets.symmetric(vertical: 14),
          iconSize: 24,
          gap: 8,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.blue,
          selectedIndex: _selected,
          onTabChange: (index) {
            setState(() {
              _selected = index;
            });
          },
          tabs: [
            GButton(
              icon: UniconsLine.lock_open_alt,
              text: "Activity",
            ),
            GButton(
              icon: UniconsLine.location_point,
              text: "Geofencing",
            ),
            GButton(
              icon: UniconsLine.apps,
              text: "More",
            ),
          ],
        ),
      ),
    );
  }
}
