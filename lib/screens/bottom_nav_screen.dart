import 'package:flutter/material.dart';
import 'package:tastybite/core/app_colors.dart';
import 'package:tastybite/screens/home_screen.dart';
import 'package:tastybite/screens/notification_screen.dart';
import 'package:tastybite/screens/profile_screen.dart';
import 'package:tastybite/screens/search_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Color _getItemColor(int index) {
    return _selectedIndex == index ? AppColors.primary : AppColors.grey;
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery sizes
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.07;
    final notchMargin = screenHeight * 0.007;
    final paddingHorizontal = screenWidth * 0.02;

    return Scaffold(
      body: _screens[_selectedIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: screenWidth * 0.17,
        width: screenWidth * 0.17,
        child: FloatingActionButton(
          backgroundColor: AppColors.greenButton,
          onPressed: () {},
          shape: const CircleBorder(),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Image.asset('assets/images/cap.png'),
          ),
        ),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenWidth * 0.07),
          topRight: Radius.circular(screenWidth * 0.07),
        ),
        child: BottomAppBar(
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: notchMargin,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.home,
                        size: iconSize,
                        color: _getItemColor(0),
                      ),
                      onPressed: () => _onItemTapped(0),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        size: iconSize,
                        color: _getItemColor(1),
                      ),
                      onPressed: () => _onItemTapped(1),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications_outlined,
                        size: iconSize,
                        color: _getItemColor(2),
                      ),
                      onPressed: () => _onItemTapped(2),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.person_outline,
                        size: iconSize,
                        color: _getItemColor(3),
                      ),
                      onPressed: () => _onItemTapped(3),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
