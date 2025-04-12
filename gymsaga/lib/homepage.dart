import 'package:flutter/material.dart';
import 'navbar.dart';
import 'steps.dart';
import 'profile.dart';
import 'workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEDFB6),
      body: SafeArea(
        child: Stack(
          children: [
            // Decor overlay right under header
            Positioned(
              top: 80, // adjust based on height of header.png
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/widgets/background/decor_atas.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Background Header Image (fixed at the top)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/widgets/background/header.png',
                fit: BoxFit.cover,
              ),
            ),

            // Centered "WELCOME BACK, KATIE" Text
            Positioned(
              top: 24,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  children: [
                    // Text outline
                    Text(
                      'WELCOME BACK, KATIE',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Jersey25',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.black,
                      ),
                    ),
                    // Text fill with shadow
                    Text(
                      'WELCOME BACK, KATIE',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Jersey25',
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 5),
                            blurRadius: 0,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actual page content
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 160), // make space for background
                  
                  // Daily Quest section with frame
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/widgets/background/quest_frame.png',
                          width: double.infinity,
                        ),
                        const Positioned(
                          top: 25,
                          child: Text(
                            'Daily Quest:',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              fontFamily: 'Jersey25',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Weekly calendar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDayBox('Sun', '2', false),
                        _buildDayBox('Mon', '3', false),
                        _buildDayBox('Tue', '4', false),
                        _buildDayBox('Wed', '5', true),
                        _buildDayBox('Thu', '6', false),
                        _buildDayBox('Fri', '7', false),
                        _buildDayBox('Sat', '8', false),
                      ],
                    ),
                  ),
                  
                  // Reminder box
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3D5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.scale, color: Colors.black),
                        SizedBox(width: 10),
                        Text(
                          "Don't forget to do your daily weigh in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.close, color: Colors.black),
                      ],
                    ),
                  ),
                  
                  // Today's workouts header
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Today's Scheduled Workouts",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jersey25',
                        ),
                      ),
                    ),
                  ),
                  
                  // Workout cards
                  _buildWorkoutCard(
                    title: "Push Day",
                    xp: "+120 XP",
                    exercises: "Pushups | Pike Pushups | Dips",
                  ),
                  _buildWorkoutCard(
                    title: "Legs",
                    xp: "+120 XP",
                    exercises: "Squats | Lunges | Glute Bridges | Calf Rises",
                    showAddButton: true,
                  ),
                  
                  const SizedBox(height: 80), // Extra space for navbar
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 0),
    );
  }

  Widget _buildDayBox(String day, String number, bool isSelected) {
    return Container(
      width: 35,
      height: 50,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFFF5252) : const Color(0xFFFFD54F),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day, 
            style: const TextStyle(
              fontSize: 10, 
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            )
          ),
          Text(
            number, 
            style: const TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            )
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard({
    required String title,
    required String xp,
    required String exercises,
    bool showAddButton = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3D5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jersey25',
                        ),
                      ),
                      Text(
                        xp,
                        style: const TextStyle(
                          color: Colors.blue, 
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    exercises,
                    style: TextStyle(
                      fontSize: 12, 
                      color: Colors.grey[700],
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            if (showAddButton)
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9800),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}