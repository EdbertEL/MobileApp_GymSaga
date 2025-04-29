import 'package:flutter/material.dart';
import 'permission.dart';

class ActivityPersonalization extends StatelessWidget {
  const ActivityPersonalization({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF9DEAF),
      body: SafeArea(
        child: Center(
          // Wrap with Center
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: screenHeight - MediaQuery.of(context).padding.top,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      'What\'s your activity level?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Jersey25',
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    _buildActivityOption(
                      context,
                      'assets/widgets/images/desk_icon.png',
                      'I sit in my desk all day',
                    ),
                    const SizedBox(height: 20),
                    _buildActivityOption(
                      context,
                      'assets/widgets/images/walking_icon.png',
                      'I walk occasionally for 30m',
                    ),
                    const SizedBox(height: 20),
                    _buildActivityOption(
                      context,
                      'assets/widgets/images/workout_icon.png',
                      'I spend at least an hour working out',
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityOption(
    BuildContext context,
    String iconAsset,
    String text,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.7;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          child: Image.asset(
            iconAsset,
            color: Colors.black,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                text.contains('desk')
                    ? Icons.computer
                    : text.contains('walk')
                        ? Icons.directions_walk
                        : Icons.fitness_center,
                size: 50,
                color: Colors.black,
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const PermissionPage()),
            );
          },
          child: Container(
            width: buttonWidth,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/widgets/buttons/golden_button.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Transform.translate(
                offset: const Offset(0, -5), // Lift text slightly upwards
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Jersey25',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}