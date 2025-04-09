import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final Function(int)? onTap;

  const CustomNavBar({Key? key, this.onTap}) : super(key: key);

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
        // Background image with error handling
        Positioned(
          bottom: 0,
          child: Image.asset(
            'assets/widgets/background/navbar_bg.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey,
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Text('Navbar background not found'),
              );
            },
          ),
        ),
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

        // Call onTap if provided
        if (widget.onTap != null) {
          widget.onTap!(index);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Button background with error handling
              Image.asset(
                _selectedIndex == index
                    ? 'assets/widgets/buttons/buttonn_pressed.png'
                    : 'assets/widgets/buttons/navbar_button.png',
                width: 50,
                height: 50,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 50,
                    height: 50,
                    color: _selectedIndex == index ? Colors.blue : Colors.grey,
                    child: Text('Button image not found'),
                  );
                },
              ),
              // Icon with error handling
              Image.asset(
                iconPath,
                width: 30,
                height: 30,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 30,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
