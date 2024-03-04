import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:testsdk/account/account_screen.dart';
import 'package:testsdk/authentication/login_screen.dart';
import 'package:testsdk/authentication/signup_screen.dart';
import 'package:testsdk/onboarding/onboardingscreen.dart';


class NavScreen extends StatefulWidget {
  NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  
  final List<Widget> _pages =[
   OnboardingScreen(),
   SignupScreen(),
   LoginScreen(),
   AccountScreen()
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: GNav(
        selectedIndex: _selectedIndex,
        gap: 8,
        onTabChange: _navigateBottomBar,
        hoverColor: Colors.black,
        backgroundColor: Colors.purple.shade200,
        color: Colors.red,
        activeColor: Colors.green,
        tabBackgroundColor: Colors.purple,
        tabs: [
          GButton(icon: Icons.home,
          
          text: 'Home',
          ),
          GButton(icon: Icons.favorite_border,
          text: 'Likes',
          ),
          GButton(icon: Icons.search,
          text: 'Search',
          ),
          GButton(icon: Icons.settings,
          text: 'Settings',
          ),
        ],
      ),
    );
  }
}