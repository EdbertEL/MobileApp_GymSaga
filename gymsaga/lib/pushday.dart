import 'package:flutter/material.dart';
import 'navbar.dart';
import 'dart:async';

class PushDayPage extends StatefulWidget {
  const PushDayPage({super.key});

  @override
  State<PushDayPage> createState() => _PushDayPageState();
}

class _PushDayPageState extends State<PushDayPage> {
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
                      'Push Day',
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
                      'Push Day',
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
            buildExerciseCard('Pushups – 3 x 12 Reps'),
            const SizedBox(height: 10),
            buildExerciseCard('Pike Pushups – 3 x 12 Reps'),
            const SizedBox(height: 10),
            buildExerciseCard('Dips – 2 x 12 Reps'),
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
                    '+120 XP',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 22,
                      color: Color(0xFF38B6FF),
                    ),
                  ),
                  Text(
                    '🔥 200 KCAL',
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
                    'Pushups',
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
                      'assets/widgets/images/pushupman.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Judul
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Text(
                    'Pushups',
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
                    '3 x 12',
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PushupTimerPage()),
              );
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

// Adding PushupTimerPage in the same file
class PushupTimerPage extends StatefulWidget {
  const PushupTimerPage({super.key});

  @override
  State<PushupTimerPage> createState() => _PushupTimerPageState();
}

class _PushupTimerPageState extends State<PushupTimerPage> {
  // Timer related variables 
  Map<int, bool> isSetStarted = {1: false, 2: false, 3: false};
  Map<int, bool> isSetFinished = {1: false, 2: false, 3: false};
  Map<int, int> remainingMilliseconds = {1: 10000, 2: 10000, 3: 10000}; // 2 minutes per set
  Map<int, dynamic> timers = {1: null, 2: null, 3: null};
  bool showCongratulations = false;

  @override
  void dispose() {
    // Cancel all active timers when widget is disposed
    timers.forEach((set, timer) {
      if (timer is Timer && timer.isActive) {
        timer.cancel();
      }
    });
    super.dispose();
  }

  void startTimer(int setNumber) {
    if (isSetFinished[setNumber] == true) {
      return; // Don't start timer if set is already finished
    }
    
    // Reset timer if already started
    if (isSetStarted[setNumber] == true) {
      timers[setNumber]?.cancel();
      remainingMilliseconds[setNumber] = 120000;
    }

    setState(() {
      isSetStarted[setNumber] = true;
    });

    timers[setNumber] = Timer.periodic(const Duration(milliseconds: 10), (Timer timer) {
      setState(() {
        if (remainingMilliseconds[setNumber]! > 0) {
          remainingMilliseconds[setNumber] = remainingMilliseconds[setNumber]! - 10;
        } else {
          // Timer finished
          timer.cancel();
          isSetFinished[setNumber] = true;
          
          // Check if all sets are finished
          if (isSetFinished[1]! && isSetFinished[2]! && isSetFinished[3]!) {
            showCongratulations = true;
          }
        }
      });
    });
  }

  String formatTime(int totalMilliseconds) {
    int minutes = (totalMilliseconds ~/ 60000) % 60;
    int seconds = (totalMilliseconds ~/ 1000) % 60;
    int milliseconds = totalMilliseconds % 1000;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${(milliseconds ~/ 10).toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E4C3),
      body: SafeArea(
        child: Stack(
          children: [
            // Background
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 80,
                color: const Color(0xFFFFE9B2),
                child: Row(
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 16),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    
                    // Title
                    Expanded(
                      child: Center(
                        child: Stack(
                          children: [
                            // Outline text
                            Text(
                              'PUSHUPS',
                              style: TextStyle(
                                fontFamily: 'Jersey25',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 2
                                  ..color = Colors.black,
                              ),
                            ),
                            // Fill text
                            const Text(
                              'PUSHUPS',
                              style: TextStyle(
                                fontFamily: 'Jersey25',
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Placeholder for symmetry (removing settings)
                    const SizedBox(width: 56),
                  ],
                ),
              ),
            ),
            
            // Main Content
            Positioned.fill(
              top: 80,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/widgets/background/decor_atas.png'),
                    fit: BoxFit.cover,
                    opacity: 0.3,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        
                        // Set 1
                        buildSetSection(1),
                        
                        const SizedBox(height: 24),
                        
                        // Set 2
                        buildSetSection(2),
                        
                        const SizedBox(height: 24),
                        
                        // Set 3
                        buildSetSection(3),
                        
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            
            // Congratulations Popup
            if (showCongratulations)
              Positioned(
                left: 0,
                right: 0,
                bottom: kBottomNavigationBarHeight,
                child: buildCongratulationsPopup(),
              ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 2),
    );
  }

  Widget buildSetSection(int setNumber) {
    String setTitle = 'SET $setNumber';
    bool isFinished = isSetFinished[setNumber] ?? false;
    
    return Column(
      children: [
        // Set Title
        Stack(
          alignment: Alignment.center,
          children: [
            // Outline
            Text(
              setTitle,
              style: TextStyle(
                fontFamily: 'Jersey25',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.black,
              ),
            ),
            // Fill
            Text(
              setTitle,
              style: const TextStyle(
                fontFamily: 'Jersey25',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        
        // Rest Timer Label
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 8, bottom: 8, top: 8),
            child: Text(
              'Rest Timer',
              style: TextStyle(
                fontFamily: 'Jersey25',
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
        
        // Timer Display
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE9B2),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.orange,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              formatTime(remainingMilliseconds[setNumber] ?? 120000),
              style: const TextStyle(
                fontFamily: 'Jersey25',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Start Button or Finished
        GestureDetector(
          onTap: isFinished ? null : () => startTimer(setNumber),
          child: Opacity(
            opacity: isFinished ? 0.5 : 1.0,
            child: Container(
              width: double.infinity,
              height: 60,
              padding: const EdgeInsets.only(top: 4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/widgets/buttons/golden_button.png'),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              alignment: const Alignment(0, 0),
              child: Text(
                isFinished ? 'FINISHED' : 'START',
                style: const TextStyle(
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
        ),
      ],
    );
  }

  Widget buildCongratulationsPopup() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
           width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFFFD185),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'CONGRATULATIONS\nON FINISHING',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Jersey25',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),
              Text(
                'YOUR WORKOUT!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Jersey25',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(2, 2),
                      blurRadius: 2,
                    ),
                  ],
                ),
              ),

              Image.asset(
                'assets/widgets/images/dumbell_image.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/widgets/buttons/golden_button.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: const Alignment(0, -0.7),
                  child: const Text(
                    'CONTINUE',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 24,
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
    );
  }
}
