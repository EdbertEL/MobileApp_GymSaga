import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateWorkoutPage extends StatefulWidget {
  const CreateWorkoutPage({Key? key}) : super(key: key);

  @override
  State<CreateWorkoutPage> createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {
  final TextEditingController _workoutNameController = TextEditingController();
  final TextEditingController _exerciseNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  
  int sets = 4;
  int reps = 20;
  String activityTime = "none";
  String restTime = "00:30";

  @override
  void dispose() {
    _workoutNameController.dispose();
    _exerciseNameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _exerciseNameController.text = "Jumping-Jacks";
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
            // Header with orange background (similar to workout_history.dart)
            Container(
              color: const Color.fromARGB(
                  255, 228, 205, 167), // Light orange/beige background color
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
                      // CREATE A WORKOUT text
                      const Expanded(
                        child: Text(
                          'Create a Workout',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(
                                255, 32, 32, 32), // Dark text color
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      
                      // Settings gear icon
                      Positioned(
              top: 32, // same vertical as text for alignment
              right: 16,
              child: Icon(
                Icons.settings,
                color: Colors.black,
                size: 28,
                shadows: [
                  Shadow(
                    offset: Offset(0, 3),
                    blurRadius: 0,
                    color: Colors.white,
                  ),
                ],
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

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Workout Name:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      
                      // Workout name input field with border
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD580), // Light orange
                          border: Border.all(
                            color: Colors.brown,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: TextField(
                          controller: _workoutNameController,
                          decoration: const InputDecoration(
                            hintText: '....',
                            border: OutlineInputBorder(),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 24.0),
                      const Text(
                        'Create an exercise:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      
                      // Exercise details box
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD580), // Light orange
                          border: Border.all(
                            color: Colors.brown,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _exerciseNameController.text,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            
                            // Sets and reps row
                            Row(
                              children: [
                                const Text(
                                  'Sets: 4',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const Spacer(),
                                
                                // Activity time and rest time display
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Activity Time: none',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      'Rest Time: 00:30',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            
                            const Row(
                              children: [
                                Text(
                                  'Reps: 20',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16.0),
                      
                      // START NOW button with golden_button_large.png
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Handle start now action
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/widgets/buttons/golden_button_large.png',
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  ),
                                  const Text(
                                    'START NOW',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 1,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          
                          // Plus button
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFA500), // Orange
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.brown, width: 2),
                            ),
                            width: 50.0,
                            height: 50.0,
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 12.0),
                      const Center(
                        child: Text(
                          'or',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      
                      // Schedule Workout section
                      const Text(
                        'Schedule Workout:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      
                      // Date picker field
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD580), // Light orange
                          border: Border.all(
                            color: Colors.brown,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _dateController,
                                decoration: const InputDecoration(
                                  hintText: '....',
                                  border: OutlineInputBorder(),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                ),
                                readOnly: true,
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            
                            // Calendar button
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFA500), // Orange
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: Colors.brown, width: 2),
                              ),
                              width: 50.0,
                              height: 46.0,
                              child: const Center(
                                child: Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16.0),
                      
                      // SCHEDULE button using golden_button_large.png
                      GestureDetector(
                        onTap: () {
                          // Handle schedule action
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/widgets/buttons/golden_button_large.png',
                              fit: BoxFit.fill,
                              width: double.infinity,
                            ),
                            const Text(
                              'SCHEDULE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 1,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
         ],
        ),
      ),
    );
  }
}