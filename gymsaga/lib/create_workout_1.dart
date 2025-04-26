import 'package:flutter/material.dart';
import 'package:gymsaga/custom_workout.dart';

class CustomWorkoutPage extends StatelessWidget {
  final String workoutName;
  final List<Map<String, dynamic>> exercises;
  final String date;

  const CustomWorkoutPage({
    Key? key,
    required this.workoutName,
    required this.exercises,
    required this.date,
  }) : super(key: key);

  // Menghitung total XP
  int calculateTotalXP() {
    int totalXP = 0;
    for (var exercise in exercises) {
      int sets = exercise['sets'];
      int reps = exercise['reps'];
      int baseXP = 15 * sets;
      int extraXP = ((reps - 20) > 0) ? ((reps - 20) ~/ 5) * 5 : 0;
      totalXP += (baseXP + extraXP);
    }
    return totalXP;
  }

  // Menghitung total KCAL
  int calculateTotalKCAL() {
    int totalKCAL = 0;
    for (var exercise in exercises) {
      int sets = exercise['sets'];
      int reps = exercise['reps'];
      int baseKCAL = 10 * sets;
      int extraKCAL = ((reps - 20) > 0) ? ((reps - 20) ~/ 5) * 3 : 0;
      totalKCAL += (baseKCAL + extraKCAL);
    }
    return totalKCAL;
  }

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
            // HEADER
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
                          Shadow(offset: Offset(0, 3), blurRadius: 0, color: Colors.white),
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

            // BODY
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    ...exercises.map((exercise) => Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/widgets/background/frame.png',
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.3),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.fitness_center,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        exercise['exerciseName'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Sets: ${exercise['sets']}  Reps: ${exercise['reps']}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        "Active: ${exercise['activityTime']}  Rest: ${exercise['restTime']}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),

                    // Rewards
                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        "Rewards",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          letterSpacing: 2.0,
                        ),
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
                                "+${calculateTotalXP()} XP",
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
                                    "${calculateTotalKCAL()} KCAL",
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
                    // Tambahkan ini setelah Rewards!
const SizedBox(height: 24),

// Tombol START
Container(
  width: double.infinity,
  height: 100,
  margin: const EdgeInsets.symmetric(horizontal: 20),
  child: GestureDetector(
    onTap: () {
      if (exercises.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomWorkoutTimerPage(
              workoutName: workoutName,
              exerciseName: exercises[0]['exerciseName'],
              sets: exercises[0]['sets'],
              reps: exercises[0]['reps'],
              activityTime: exercises[0]['activityTime'],
              restTime: exercises[0]['restTime'],
              date: date,
            ),
          ),
        );
      }
    },
    child: Image.asset(
      'assets/widgets/buttons/start_button.png',
      fit: BoxFit.contain,
      filterQuality: FilterQuality.none,
    ),
  ),
),
const SizedBox(height: 40),

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
