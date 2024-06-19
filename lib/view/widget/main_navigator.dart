import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:our_launderland/utils/color_pallete.dart';

import '../pages/home.dart';
import '../pages/profile.dart';
import '../pages/riwayat.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;
  List<Widget> _screen = [
    Home(),
    Riwayat(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screen[_selectedIndex],
        bottomNavigationBar: Container(
          height: 65,
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          padding: EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(1, 1),
                    spreadRadius: 5,
                    color: ColorPallete.colorprimary.withOpacity(0.3))
              ],
              color: ColorPallete.colorprimary),
          child: GNav(
              gap: 8,
              color: Colors.white,
              padding: EdgeInsets.all(10),
              activeColor: ColorPallete.colorprimary,
              tabBackgroundColor: Colors.white.withOpacity(0.9),
              tabBorderRadius: 18,
              onTabChange: (i) {
                setState(() {
                  _selectedIndex = i;
                });
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(icon: Icons.history, text: 'Riwayat'),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ]),
        ));
  }
}
