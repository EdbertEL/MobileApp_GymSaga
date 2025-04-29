import 'package:flutter/material.dart';
import '../navbar.dart';
import '../workout_data.dart'; // Add this import for completedWorkouts

class ExerciseFinishedCard extends StatefulWidget {
  final VoidCallback onComplete;
  final String workoutName; // Add workout name parameter
  final List<Map<String, dynamic>> exercises; // Add exercises parameter

  const ExerciseFinishedCard({
    super.key, 
    required this.onComplete,
    this.workoutName = "Daily Workout", // Default name if not provided
    this.exercises = const [], // Default empty list if not provided
  });

  @override
  State<ExerciseFinishedCard> createState() => _ExerciseFinishedCardState();
}

class _ExerciseFinishedCardState extends State<ExerciseFinishedCard> {
  bool isExpanded = false;
  final int totalXP = 120; // You can make this dynamic if needed
  final int totalKCAL = 200; // You can make this dynamic if needed
  
  // List to store exercise data from the exercise boxes
  late List<Map<String, dynamic>> exercisesList;
  
  @override
  void initState() {
    super.initState();
    
    // If no exercises are provided, create them from the exercise boxes
    if (widget.exercises.isEmpty) {
      exercisesList = [
        {
          'exerciseName': 'Pushups',
          'sets': '3',
          'reps': '10-20',
          'activityTime': '45s',
          'restTime': '30s',
        },
        {
          'exerciseName': 'Pike Pushups',
          'sets': '3',
          'reps': '10-12',
          'activityTime': '30s',
          'restTime': '30s',
        },
        {
          'exerciseName': 'Pike Pushups',
          'sets': '3',
          'reps': '10-12',
          'activityTime': '30s',
          'restTime': '30s',
        },
        {
          'exerciseName': 'Dips',
          'sets': '3',
          'reps': '10-15',
          'activityTime': '40s',
          'restTime': '30s',
        },
      ];
    } else {
      exercisesList = widget.exercises;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E4C3),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/widgets/background/checkerboard.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Image.asset('assets/widgets/background/decor_atas.png'),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset('assets/widgets/background/header.png'),
            ),
            Positioned(
              top: 24,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  'Workout',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Jersey25',
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 2,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Image.asset(
                    'assets/widgets/buttons/back_button.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            //  Container dengan frame
            Positioned(
              top: 120,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  ...exercisesList.map((exercise) => 
                    Column(
                      children: [
                        buildFinishedExerciseBox("${exercise['exerciseName']} – ${exercise['sets']} x ${exercise['reps']} Reps"),
                        const SizedBox(height: 12),
                      ],
                    )
                  ).toList(),
                ],
              ),
            ),

            //  Rewards dan Complete button
            Positioned(
              top: 500,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rewards',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 24,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/widgets/background/frame.png'),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '+$totalXP XP',
                                    style: const TextStyle(
                                      fontFamily: 'Jersey25',
                                      fontSize: 20,
                                      color: Color(0xFF38B6FF),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    '🔥 $totalKCAL KCAL',
                                    style: const TextStyle(
                                      fontFamily: 'Jersey25',
                                      fontSize: 20,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isExpanded = !isExpanded;
                                  });
                                },
                                child: Icon(
                                  isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  size: 28,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (isExpanded)
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '+ Explosive Strength',
                                  style: TextStyle(
                                    fontFamily: 'Jersey25',
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  '+ Upper body strength',
                                  style: TextStyle(
                                    fontFamily: 'Jersey25',
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Save workout data to completedWorkouts list
                        saveWorkoutToHistory();
                        
                        // Call the onComplete callback
                        widget.onComplete();
                      },
                      child: Container(
                        width: 200,
                        height: 60,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/widgets/buttons/golden_button.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        alignment: const Alignment(0, -0.7),
                        child: const Text(
                          'COMPLETE',
                          style: TextStyle(
                            fontFamily: 'Jersey25',
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
    );
  }

  // Function to save workout data to history
  void saveWorkoutToHistory() {
    // Use helper function for consistent date formatting
    final formattedDate = getCurrentFormattedDate();
    
    // Add the workout to completedWorkouts with all details
    completedWorkouts.add({
      'workoutName': widget.workoutName,
      'date': formattedDate,
      'totalXP': totalXP,
      'totalKCAL': totalKCAL,
      'exercises': exercisesList, // Store exercises list
    });
  }

  Widget buildFinishedExerciseBox(String text) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/widgets/background/frame.png'),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Jersey25',
              fontSize: 22,
              color: Colors.black87,
            ),
          ),
        ),
        Positioned(
          top: 27,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 16,
            child: Image.asset(
              'assets/widgets/images/redbar.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
      ],
    );
  }
}