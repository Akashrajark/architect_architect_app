import 'package:dreamhome_architect/features/Profile/profile_screen.dart';
import 'package:dreamhome_architect/features/acquired_screen/acquired_screen.dart';
import 'package:dreamhome_architect/features/create_home_plan/create_home_plan_screen.dart';
import 'package:dreamhome_architect/features/payment/payment_screen.dart';
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
    CreateHomePlanScreen(),
    AcquiredScreen(),
    ProfileScreen(),
    PaymentScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GNav(
            rippleColor: Colors.grey[800]!,
            hoverColor: Colors.grey[700]!,
            haptic: true,
            tabBorderRadius: 25,
            tabActiveBorder: Border.all(color: onprimaryColor, width: 1),
            tabBorder: Border.all(color: Colors.grey[800]!, width: 1),
            tabShadow: [
              BoxShadow(color: Colors.grey.withAlpha(5), blurRadius: 8)
            ],
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 200),
            gap: 8,
            color: Colors.grey[800],
            activeColor: Colors.white,
            iconSize: 24,
            tabBackgroundColor: Colors.black.withAlpha(1),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.sell_outlined,
                text: 'Acquired',
              ),
              GButton(
                icon: LineIcons.dollarSign,
                text: 'Payment',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
