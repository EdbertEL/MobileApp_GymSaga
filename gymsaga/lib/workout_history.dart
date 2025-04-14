import 'package:flutter/material.dart';

class WorkoutHistoryPage extends StatelessWidget {
  const WorkoutHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with orange background
          Container(
            color: const Color.fromARGB(255, 228, 205, 167), // Light orange/beige background color
            padding: const EdgeInsets.only(
              top: 40.0,
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: Column(
              children: [
                // Back button and title
                Row(
                  children: [
                    // Back button
                    Image.asset(
                      'assets/widgets/buttons/back_button.png',
                      width: 30.0,
                      height: 30.0,
                    ),
                    const SizedBox(width: 10.0),
                    // WORKOUT HISTORY text
                    const Text(
                      'WORKOUT HISTORY',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 32, 32, 32), // Dark blue color for text
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                // Underline image
                Image.asset(
                  'assets/widgets/background/garis.png',
                  width: double.infinity,
                  height: 8.0,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
          ),           
          
        ],
      ),
    );
  }
}