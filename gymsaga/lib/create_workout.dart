import 'package:flutter/material.dart';
import 'package:gymsaga/create_exercise.dart';
import 'package:intl/intl.dart';
import 'package:gymsaga/create_workout_1.dart';

class CreateWorkoutPage extends StatefulWidget {
  const CreateWorkoutPage({Key? key}) : super(key: key);

  @override
  State<CreateWorkoutPage> createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {
  final TextEditingController _workoutNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // List to store multiple exercises
  List<Map<String, dynamic>> exercises = [];

  @override
  void dispose() {
    _workoutNameController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    // Membatasi pilihan tanggal hanya untuk April 2025
    final DateTime initialDate = DateTime(2025, 4, 15); // Mid April 2025
    final DateTime firstDate = DateTime(2025, 4, 1); // April 1, 2025
    final DateTime lastDate = DateTime(2025, 4, 30); // April 30, 2025

    // Menampilkan dialog tanggal
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            fontFamily: "Jersey25",
            colorScheme: ColorScheme.light(
              primary: Colors.orange, // Warna header & tombol OK
              onPrimary: Colors.white, // Warna teks pada tombol OK
              onSurface: Colors.black87, // Warna teks pada tanggal
            ),
            dialogBackgroundColor: Color(0xFFFBEBD2), // Warna latar dialog
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange, // Warna tombol CANCEL dan OK
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null) {
      // Mengubah format tanggal menjadi dd/MM/yyyy
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  // Function to add a new exercise
  void _addExercise() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateExercisePage(),
      ),
    );

    if (result != null) {
      setState(() {
        exercises.add({
          'exerciseName': result['exerciseName'],
          'sets': int.parse(result['sets']),
          'reps': int.parse(result['reps']),
          'activityTime': result['activeTime'],
          'restTime': result['restTime'],
        });
      });
    }
  }

  // Function to remove an exercise
  void _removeExercise(int index) {
    setState(() {
      exercises.removeAt(index);
    });
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
                  Container(
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

                      // Workout name input field with frame.png background
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Background frame image
                          Image.asset(
                            'assets/widgets/background/frame.png',
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          // Input field on top of the frame
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: TextField(
                              controller: _workoutNameController,
                              decoration: const InputDecoration(
                                hintText: '....',
                                border: OutlineInputBorder(),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8.0),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24.0),
                      const Text(
                        'Create exercises:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),

                      // Show exercises list if any exercises exist
                      ...exercises.asMap().entries.map((entry) {
                        int index = entry.key;
                        var exercise = entry.value;

                        return Column(
                          children: [
                            Stack(
                              children: [
                                // Background frame image
                                Image.asset(
                                  'assets/widgets/background/frame.png',
                                  width: double.infinity,
                                  height: 120,
                                  fit: BoxFit.fill,
                                ),
                                // Exercise details content
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              exercise['exerciseName'],
                                              style: const TextStyle(
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 4.0),

                                            // Sets and reps row
                                            Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Sets: ${exercise['sets']}',
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Reps: ${exercise['reps']}',
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 1,
                                                  color: Colors.black,
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Activity Time: ${exercise['activityTime']}',
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Rest Time: ${exercise['restTime']}',
                                                      style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 18,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Delete button
                                      GestureDetector(
                                        onTap: () => _removeExercise(index),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 28,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12.0),
                          ],
                        );
                      }).toList(),

                      // Empty state - shown when no exercises exist
                      if (exercises.isEmpty)
                        Stack(
                          children: [
                            // Background frame image
                            Image.asset(
                              'assets/widgets/background/frame.png',
                              width: double.infinity,
                              height: 120,
                              fit: BoxFit.fill,
                            ),
                            // Empty exercise prompt
                            const Padding(
                              padding: EdgeInsets.all(18.0),
                              child: Center(
                                child: Text(
                                  'No exercises added yet.\nClick the + button to add exercises.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      const SizedBox(height: 16.0),

                      // START NOW and Add Exercise button row
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Validate there's at least one exercise
                                if (exercises.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please add at least one exercise'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                // Navigate to CustomWorkoutPage with first exercise
                                // You may need to modify CustomWorkoutPage to accept a list of exercises
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CustomWorkoutPage(
                                      workoutName: _workoutNameController.text,
                                      exercises: exercises,
                                      date: _dateController.text.isEmpty
                                          ? 'Today'
                                          : _dateController.text,
                                    ),
                                  ),
                                );
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/widgets/buttons/startnow.png',
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                    filterQuality: FilterQuality.none,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),

                          // Plus button to add exercise
                          GestureDetector(
                            onTap: _addExercise,
                            child: Image.asset(
                              'assets/widgets/buttons/create_workout.png',
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

                      // Date picker field with frame.png background
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          // Background frame image
                          Image.asset(
                            'assets/widgets/background/frame.png',
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          // Date picker content
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _dateController,
                                    decoration: const InputDecoration(
                                      hintText: 'Select April date...',
                                      border: OutlineInputBorder(),
                                      fillColor: Colors.white,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 8.0),
                                    ),
                                    readOnly: true,
                                  ),
                                ),
                                const SizedBox(width: 12.0),

                                // Calendar button using calendar.png asset
                                GestureDetector(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: Image.asset(
                                    'assets/widgets/buttons/calendar.png',
                                    width: 50.0,
                                    height: 46.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16.0),

                      // SCHEDULE button
                      GestureDetector(
                        onTap: () {
                          // Validasi form
                          if (_workoutNameController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter a workout name'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          if (exercises.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please add at least one exercise'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          if (_dateController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please select a date'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          // Return data to HomePage with all exercises
                          Navigator.pop(context, {
                            'workoutName': _workoutNameController.text,
                            'exercises': exercises,
                            'date': _dateController.text,
                          });
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/widgets/buttons/schedule.png',
                              fit: BoxFit.fill,
                              width: double.infinity,
                              filterQuality: FilterQuality.none,
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
