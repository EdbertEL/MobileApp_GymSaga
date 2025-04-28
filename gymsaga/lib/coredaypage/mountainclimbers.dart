import 'package:flutter/material.dart';
import '../navbar.dart';
import '../components/exercisedetailcard.dart';
import '../components/exercisetimer.dart';
import '../components/exercisefinishedcard.dart';
import '../workout.dart';

class MountainClimbersPage extends StatefulWidget {
  const MountainClimbersPage({super.key});

  @override
  State<MountainClimbersPage> createState() => _MountainClimbersPageState();
}

class _MountainClimbersPageState extends State<MountainClimbersPage> {
  bool showExerciseDetail = true;

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
              child: Center(
                child: Stack(
                  children: [
                    Text(
                      'Mountain Climbers',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Jersey25',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.black,
                      ),
                    ),
                    const Text(
                      'Mountain Climbers',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Jersey25',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
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
            Positioned.fill(
              top: 120,
              child: showExerciseDetail
                  ? ExerciseDetailCard(
                      title: 'Mountain Climbers',
                      imagePath: 'assets/widgets/images/mountainclimbers.png',
                      description:
                          'Keep your core tight\nDrive your knees quickly\nMaintain a steady pace',
                      reps: '3 x 20 (each leg)',
                      onStart: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseTimerPage(
                              onContinue: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ExerciseFinishedCard(
                                      onComplete: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const WorkoutPage(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
    );
  }
}
