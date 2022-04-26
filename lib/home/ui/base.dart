import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pro_shop_golf_club/home/ui/home.dart';
import 'package:pro_shop_golf_club/home/ui/profile.dart';
import 'package:pro_shop_golf_club/home/ui/shop.dart';
import 'package:pro_shop_golf_club/home/ui/tournaments.dart';
import 'package:pro_shop_golf_club/util/constants/palette.dart';

class BaseScreen extends StatefulWidget {
  BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  List<Widget> _pages = [
    Home(),
    Tournaments(),
    Shop(),
    Profile(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 1),
                  color: Palette.primaryGreen.withOpacity(0.4),
                  blurRadius: 4),
            ],
          ),
          padding: EdgeInsets.all(8),
          child: GNav(
              haptic: false, // haptic feedback
              tabBorderRadius: 30, // tab button border
              curve: Curves.bounceIn, // tab animation curves
              duration: Duration(milliseconds: 500), // tab animation duration
              gap: 8, // the tab button gap between icon and text
              color: Colors.black, // unselected icon color
              activeColor: Palette.primaryGreen, // selected icon and text color
              iconSize: 24, // tab button icon size
              tabBackgroundColor: Palette.secondaryColor
                  .withOpacity(0.4)
                  .withOpacity(0.1), // selected tab background color
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: 5), // navigation bar padding
              tabs: [
                GButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  icon: Icons.golf_course_outlined,
                  text: 'Tournaments',
                ),
                GButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  icon: Icons.shop_2_outlined,
                  text: 'Shop',
                ),
                GButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                  icon: Icons.person_outline_outlined,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    );
  }
}
