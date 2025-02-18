import 'package:dreamhome_architect/features/Profile/profile_screen.dart';
import 'package:dreamhome_architect/features/acquired_screen/acquired_screen.dart';
import 'package:dreamhome_architect/features/create_home_plan/create_home_plan.dart';
import 'package:dreamhome_architect/features/view_home_plan/view_home_plan.dart';
import 'package:dreamhome_architect/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ViewHomeplan(),
    AcquiredScreen(),
    ProfileScreen(),
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _pages[_selectedIndex],
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Material(
                  color: Colors.black.withAlpha(200),
                  borderRadius: BorderRadius.circular(64),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: GNav(
                      rippleColor: Colors.grey[800]!,
                      hoverColor: Colors.grey[700]!,
                      haptic: true,
                      tabBorderRadius: 25,
                      tabActiveBorder:
                          Border.all(color: onprimaryColor, width: 1),
                      tabBorder: Border.all(color: Colors.grey[800]!, width: 1),
                      tabShadow: [
                        BoxShadow(
                            color: Colors.grey.withAlpha(5), blurRadius: 8)
                      ],
                      curve: Curves.easeOutExpo,
                      duration: const Duration(milliseconds: 200),
                      gap: 8,
                      color: Colors.grey[800],
                      activeColor: Colors.white,
                      iconSize: 24,
                      tabBackgroundColor: Colors.black.withAlpha(1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      selectedIndex: _selectedIndex,
                      onTabChange: (index) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      tabs: const [
                        GButton(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          icon: LineIcons.home,
                          text: 'Home',
                        ),
                        GButton(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          icon: Icons.sell_outlined,
                          text: 'Acquired',
                        ),
                        GButton(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          icon: LineIcons.user,
                          text: 'Profile',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateHomePlan(),
                    ));
              },
              child: Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }
}
