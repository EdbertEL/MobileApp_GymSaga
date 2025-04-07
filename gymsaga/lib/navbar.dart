import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = -1;

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
            children: [
              _buildNavItem(0, 'assets/widgets/icons/home_icon.png'),
              _buildNavItem(1, 'assets/widgets/icons/steps_icon.png'),
              // _buildNavItem(2, 'assets/widgets/icons/dumbell.svg'),
              _buildNavItem(3, 'assets/widgets/icons/profile_navbar_icon.png'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(int index, String iconPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                _selectedIndex == index
                    ? 'assets/widgets/buttons/buttonn_pressed.png'
                    : 'assets/widgets/buttons/navbar_button.png',
                width: 50,
                height: 50,
              ),
              Image.asset(iconPath, width: 30, height: 30),
            ],
          ),
        ],
      ),
    );
  }
}