import 'package:flutter/material.dart';
import 'package:gymsaga/homepage.dart';
import 'package:gymsaga/profile.dart';
import 'package:gymsaga/steps.dart';
import 'package:gymsaga/workout.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  
  const CustomNavBar({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  late int _selectedIndex;
  
  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  final List<Map<String, String>> _navButtons = [
    {
      'normal': 'assets/widgets/buttons/homepage.png',
      'pressed': 'assets/widgets/buttons/homepage_pressed.png',
      'label': 'Home'
    },
    {
      'normal': 'assets/widgets/buttons/steps.png',
      'pressed': 'assets/widgets/buttons/steps_pressed.png',
      'label': 'Steps'
    },
    {
      'normal': 'assets/widgets/buttons/workout.png',
      'pressed': 'assets/widgets/buttons/workout_pressed.png',
      'label': 'Workout'
    },
    {
      'normal': 'assets/widgets/buttons/profile.png',
      'pressed': 'assets/widgets/buttons/profile_pressed.png',
      'label': 'Profile'
    },
  ];

  void _navigateToPage(int index) {
    if (_selectedIndex == index) return; // Skip if already on this page
    
    setState(() {
      _selectedIndex = index;
    });

    // Use '/home' instead of '/' for the homepage navigation
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(
          context, 
          '/home', // Changed from '/' to '/home'
          arguments: {'noAnimation': true}
        );
        break;
      case 1:
        Navigator.pushReplacementNamed(
          context, 
          '/steps',
          arguments: {'noAnimation': true}
        );
        break;
      case 2:
        Navigator.pushReplacementNamed(
          context, 
          '/workout',
          arguments: {'noAnimation': true}
        );
        break;
      case 3:
        Navigator.pushReplacementNamed(
          context, 
          '/profile',
          arguments: {'noAnimation': true}
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/widgets/background/navbar_bg2.png'),
          fit: BoxFit.cover,
          filterQuality: FilterQuality.none, // Mempertahankan tampilan pixelated
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_navButtons.length, (index) {
          return _buildNavItem(index);
        }),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _navigateToPage(index),
      child: Container(
        width: MediaQuery.of(context).size.width / _navButtons.length,
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Image.asset(
          isSelected ? _navButtons[index]['pressed']! : _navButtons[index]['normal']!,
          width: 99,
          height: 99,
          filterQuality: FilterQuality.none,
        ),
      ),
    );
  }
}