import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0; // Set default selected index to 0 (home)

  // Define list of button paths for normal and pressed states
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Background Navbar
        Positioned(
          bottom: 0,
          child: Image.asset(
            'assets/widgets/background/navbar_bg.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        // Row dengan 4 Button
        Positioned(
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_navButtons.length, (index) {
              return _buildNavItem(index);
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(int index) {
    bool isSelected = _selectedIndex == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / _navButtons.length,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(
          isSelected ? _navButtons[index]['pressed']! : _navButtons[index]['normal']!,
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}