import 'package:flutter/material.dart';
import 'navbar.dart';

class StepsPage extends StatefulWidget {
  const StepsPage({Key? key}) : super(key: key);

  @override
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> {
  int currentSteps = 0; // Track steps here, can be updated later

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF7E4C3),
      body: SafeArea(
        child: Stack(
          children: [
            // Pixelated background image (top 3/4 of screen)
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              height: screenHeight * 3/4 - 100,
              child: Image.asset(
                'assets/widgets/background/background_steps_spliced.png',
                fit: BoxFit.cover,
              ),
            ),

            // Header Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/widgets/background/header.png',
                fit: BoxFit.cover,
              ),
            ),

            // "STEPS" title
            Positioned(
              top: 24,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  children: [
                    Text(
                      'STEP TRACKER',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Jersey25',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.black,
                      ),
                    ),
                    Text(
                      'STEP TRACKER',
                      style: TextStyle(
                        fontSize: 32,
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

            // "STEPS TODAY" Text with orange steps and line
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'STEPS TODAY',
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Jersey25',
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 4),
                            color: Colors.white,
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    // Steps count (orange text)
                    Text(
                      '$currentSteps',
                      style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Jersey25',
                        color: Color(0xFFFF7F11), // Orange color
                        shadows: [
                          Shadow(
                            offset: Offset(0, 4),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    // 4px stroke width line (200 pixels wide)
                    Container(
                      width: 200,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Character Container Group - moved down by 80 pixels
            Positioned(
              top: screenHeight * 0.45, // 1/3 from bottom (~50% down)
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Chat bubble with steps - text moved up
                    SizedBox(
                      width: 110,
                      height: 50,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/widgets/background/run_chat_bubble.png',
                            width: 120,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                            top: 10, // Moved text higher up
                            left: 0,
                            right: 0,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '$currentSteps',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Jersey25',
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' steps',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Jersey25',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Character image
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        'assets/widgets/images/running_tracker.png',
                        height: 200,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    // "YOU" label
                    Text(
                      'You',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Jersey25',
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 4),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 1),
    );
  }

  void updateSteps(int newSteps) {
    setState(() {
      currentSteps = newSteps;
    });
  }
}