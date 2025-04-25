import 'package:flutter/material.dart';

class CustomWorkoutPage extends StatelessWidget {
  final String workoutName;
  final String exerciseName;
  final int sets;
  final int reps;
  final String activityTime;
  final String restTime;
  final String date;

  const CustomWorkoutPage({
    Key? key,
    required this.workoutName,
    required this.exerciseName,
    required this.sets,
    required this.reps,
    required this.activityTime,
    required this.restTime,
    required this.date,
  }) : super(key: key);

  // Calculate XP based on sets and reps
  int calculateXP() {
    // Base XP per set is 15
    int baseXP = 15 * sets;
    
    // Additional XP for every 5 reps above base (assuming base is 20)
    int baseReps = 20;
    int extraReps = reps - baseReps;
    int extraXP = 0;
    
    if (extraReps > 0) {
      extraXP = (extraReps / 5).floor() * 5;
    }
    
    return baseXP + extraXP;
  }
  
  // Calculate KCAL based on sets and reps
  int calculateKCAL() {
    // Base KCAL per set is 10
    int baseKCAL = 10 * sets;
    
    // Additional KCAL for every 5 reps above base (assuming base is 20)
    int baseReps = 20;
    int extraReps = reps - baseReps;
    int extraKCAL = 0;
    
    if (extraReps > 0) {
      extraKCAL = (extraReps / 5).floor() * 3;
    }
    
    return baseKCAL + extraKCAL;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Use checkerboard pattern background
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/widgets/background/checkerboard.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Column(
          children: [
            // Header with beige background
            Container(
              color: const Color.fromARGB(255, 228, 205, 167),
              padding: const EdgeInsets.only(
                top: 40.0,
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Column(
                children: [
                  // Back button and title with settings icon
                  Row(
                    children: [
                      // Back button
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/widgets/buttons/back_button.png',
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      
                      // Custom Workout text
                      const Expanded(
                        child: Text(
                          'Custom Workout',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 32, 32, 32),
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),

                      // Settings gear icon
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
                  const SizedBox(height: 8.0),
                  SizedBox(
                    width: double.infinity,
                    height: 20.0,
                    child: Image.asset(
                      'assets/widgets/background/garis.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.none,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Exercise display with orange border
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFBEBD2),
                        border: Border.all(
                          color: Colors.orange,
                          width: 4.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          // Exercise icon
                          Image.asset(
                            'assets/icons/jumping_jacks.png', // You'll need this asset
                            width: 40.0,
                            height: 40.0,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.fitness_center,
                                size: 40.0,
                                color: Colors.black,
                              );
                            },
                          ),
                          const SizedBox(width: 16.0),
                          
                          // Exercise details
                          Expanded(
                            child: Text(
                              '$exerciseName - $sets x $reps',
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Rewards section
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        children: [
                          // Rewards text with pixel font
                          const Text(
                            'Rewards',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              letterSpacing: 2.0,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          
                          // XP and KCAL display with orange border
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFBEBD2),
                              border: Border.all(
                                color: Colors.orange,
                                width: 4.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // XP reward
                                Row(
                                  children: [
                                    const Text(
                                      '+',
                                      style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Text(
                                      '${calculateXP()} XP',
                                      style: const TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                
                                // Fire icon and KCAL reward
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.local_fire_department,
                                      color: Colors.deepOrange,
                                      size: 30.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      '${calculateKCAL()} KCAL',
                                      style: const TextStyle(
                                        fontSize: 26.0,
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
                    ),

                    // Spacer to push START button to bottom
                    const Spacer(),
                    
                    // START button
                    Container(
                      width: double.infinity,
                      height: 60.0,
                      margin: const EdgeInsets.only(bottom: 24.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Start workout logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: const Text(
                          'START',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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