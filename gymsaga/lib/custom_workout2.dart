import 'package:flutter/material.dart';
import 'package:gymsaga/workout_data.dart';
import 'package:gymsaga/homepage.dart'; // Import homepage

class CustomWorkout2Page extends StatefulWidget {
  final String workoutName;
  final int totalXP;
  final int totalKCAL;
  final String date;
  final List<Map<String, dynamic>>? exercises; // Add this to receive exercises

  const CustomWorkout2Page({
    Key? key,
    required this.workoutName,
    required this.totalXP,
    required this.totalKCAL,
    required this.date,
    this.exercises, // Make it optional to maintain backward compatibility
  }) : super(key: key);

  @override
  _CustomWorkout2PageState createState() => _CustomWorkout2PageState();
}

class _CustomWorkout2PageState extends State<CustomWorkout2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/widgets/background/checkerboard.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Column(
          children: [
            // HEADER (unchanged)
            Container(
              color: const Color.fromARGB(255, 228, 205, 167),
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/widgets/buttons/back_button.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Custom Workout',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 32, 32, 32),
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.black,
                        size: 28,
                        shadows: const [
                          Shadow(
                            offset: Offset(0, 3),
                            blurRadius: 0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    height: 20,
                    child: Image.asset(
                      'assets/widgets/background/garis.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.none,
                    ),
                  ),
                ],
              ),
            ),

            // BODY (unchanged)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Workout Card with Red Line Overlay
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/widgets/background/frame.png',
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                widget.workoutName,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Date: ${widget.date}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 15,
                          color: Colors.red,
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Rewards
                    const Text(
                      "Rewards",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        letterSpacing: 2.0,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/widgets/background/frame.png',
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "+${widget.totalXP} XP",
                                style: const TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/widgets/icons/icon_api.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "${widget.totalKCAL} KCAL",
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // COMPLETE Button
                    Container(
                      width: double.infinity,
                      height: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: GestureDetector(
                        onTap: () {
                          // Use helper function for consistent date formatting
                          final formattedDate = getCurrentFormattedDate();
                          
                          // Add the workout to completedWorkouts with all details
                          completedWorkouts.add({
                            'workoutName': widget.workoutName,
                            'date': formattedDate,
                            'totalXP': widget.totalXP,
                            'totalKCAL': widget.totalKCAL,
                            'exercises': widget.exercises ?? [], // Store exercises list
                          });

                          // Replace popUntil with a direct navigation to HomePage
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false, // This clears the entire navigation stack
                          );
                        },
                        child: Image.asset(
                          'assets/widgets/buttons/complete.png',
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}