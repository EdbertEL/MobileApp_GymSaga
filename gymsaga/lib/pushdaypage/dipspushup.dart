import 'package:flutter/material.dart';
import '../navbar.dart';
import '../components/exercisedetailcard.dart';
import '../components/excercisetimer.dart';
import '../components/excercisefinishedcard.dart';
import '../workout.dart';

class DipsPushupPage extends StatefulWidget {
  const DipsPushupPage({super.key});

  @override
  State<DipsPushupPage> createState() => _DipsPushupPageState();
}

class _DipsPushupPageState extends State<DipsPushupPage> {
  bool showExerciseDetail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E4C3),
      body: SafeArea(
        child: Stack(
          children: [
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
                      'Dips',
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
                      'Dips',
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
              top: 16,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  if (showExerciseDetail) {
                    setState(() {
                      showExerciseDetail = false;
                    });
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 120,
              child: showExerciseDetail
                  ? ExerciseDetailCard(
                      title: 'Dips',
                      imagePath: 'assets/widgets/images/dips.png',
                      description:
                          'Lower your body slowly\nKeep your elbows close\nPush back up with control',
                      reps: '3 x 10',
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
                                                const WorkoutPage(), // <-- ganti ke sini
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
