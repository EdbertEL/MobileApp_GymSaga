import 'package:flutter/material.dart';
import 'navbar.dart';

class CorePage extends StatefulWidget {
  const CorePage({super.key});

  @override
  State<CorePage> createState() => _PushDayPageState();
}

class _PushDayPageState extends State<CorePage> {
  bool showExerciseDetail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E4C3),
      body: SafeArea(
        child: Stack(
          children: [
            // Dekorasi Background
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
            // Judul Push Day
            Positioned(
              top: 24,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  children: [
                    Text(
                      'Core Day',
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
                      'Core Day',
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
            // Tombol Back di header
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

            // Tampilan konten
            Positioned.fill(
              top: 120,
              child: showExerciseDetail
                  ? buildPushupDetailCard()
                  : buildWorkoutList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
    );
  }

  Widget buildWorkoutList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildExerciseCard('Plank – 60s - x4 '),
            const SizedBox(height: 10),
            buildExerciseCard('Russian Twist – 3 x 15 Reps'),
            const SizedBox(height: 10),
            buildExerciseCard('Leg Raises – 3 x 12 Reps'),
            const SizedBox(height: 10),
            buildExerciseCard('Mountain Climbers – 4 x 15 Reps'),
            const SizedBox(height: 24),
            const Text(
              'Rewards',
              style: TextStyle(
                fontFamily: 'Jersey25',
                fontSize: 24,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE9B2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    '+90 XP',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 22,
                      color: Color(0xFF38B6FF),
                    ),
                  ),
                  Text(
                    '🔥 110 KCAL',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 22,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showExerciseDetail = true;
                  });
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/widgets/buttons/golden_button.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: const Alignment(0, -0.7),
                  child: const Text(
                    'START',
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
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'or',
                style: TextStyle(
                  fontFamily: 'Jersey25',
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.orange, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Schedule Workout:',
                      style: TextStyle(
                        fontFamily: 'Jersey25',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Icon(Icons.calendar_month, color: Colors.orange),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPushupDetailCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD185),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.orange.shade800, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.shade200,
                  offset: const Offset(4, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Plank',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),

                // Gambar
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/widgets/images/plank.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Judul
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    'Plank',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),

                // Deskripsi
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Activate your core muscles\nStrict form, no cheating\nAvoid rounding up your back',
                      style: TextStyle(
                        fontFamily: 'Jersey25',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                // Reps
                const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    '60s x 2',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Tombol START di bawahnya
          GestureDetector(
            onTap: () {
              // Aksi ketika tombol ditekan (selanjutnya)
            },
            child: Container(
              width: 200,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/widgets/buttons/golden_button.png'),
                  fit: BoxFit.fill,
                ),
              ),
              alignment: const Alignment(0, -0.7),
              child: const Text(
                'START',
                style: TextStyle(
                  fontFamily: 'Jersey25',
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 2),
                      blurRadius: 0,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildExerciseCard(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9B2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
      ),
      child: Row(
        children: [
          const Icon(Icons.fitness_center, color: Colors.black),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Jersey25',
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
