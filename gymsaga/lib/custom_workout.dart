import 'dart:async';
import 'package:flutter/material.dart';

class CustomWorkoutTimerPage extends StatefulWidget {
  final String workoutName;
  final String exerciseName;
  final int sets;
  final int reps;
  final String activityTime;
  final String restTime;
  final String date;

  const CustomWorkoutTimerPage({
    Key? key,
    required this.workoutName,
    required this.exerciseName,
    required this.sets,
    required this.reps,
    required this.activityTime,
    required this.restTime,
    required this.date,
  }) : super(key: key);

  @override
  State<CustomWorkoutTimerPage> createState() => _CustomWorkoutTimerPageState();
}

class _CustomWorkoutTimerPageState extends State<CustomWorkoutTimerPage>
    with TickerProviderStateMixin {
  int _currentSet = 1;
  int _totalSeconds = 0;
  Timer? _timer;
  bool _isResting = true;
  bool _isFinished = false;
  bool _showCongrats = false;
  
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    
    // Parse rest time from the format "MM:SS"
    List<String> parts = widget.restTime.split(':');
    if (parts.length == 2) {
      int minutes = int.tryParse(parts[0]) ?? 0;
      int seconds = int.tryParse(parts[1]) ?? 0;
      _totalSeconds = minutes * 60 + seconds;
    }
    
    // Setup slide-up animation for congrats panel
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _slideController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_totalSeconds > 0) {
          _totalSeconds--;
        } else {
          if (_currentSet < widget.sets) {
            // Move to next set
            _currentSet++;
            // Reset timer for next set
            List<String> parts = widget.restTime.split(':');
            if (parts.length == 2) {
              int minutes = int.tryParse(parts[0]) ?? 0;
              int seconds = int.tryParse(parts[1]) ?? 0;
              _totalSeconds = minutes * 60 + seconds;
            }
          } else {
            // Workout completed
            _timer?.cancel();
            _isFinished = true;
            
            // Show congrats panel after a short delay
            Future.delayed(const Duration(milliseconds: 500), () {
              setState(() {
                _showCongrats = true;
                _slideController.forward();
              });
            });
          }
        }
      });
    });
  }

  String _formatTime(int totalSeconds) {
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    
    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    
    return "$hoursStr : $minutesStr : $secondsStr";
  }

  // Calculate XP based on sets and reps
  int calculateXP() {
    // Base XP per set is 15
    int baseXP = 15 * widget.sets;
    
    // Additional XP for every 5 reps above base (assuming base is 20)
    int baseReps = 20;
    int extraReps = widget.reps - baseReps;
    int extraXP = 0;
    
    if (extraReps > 0) {
      extraXP = (extraReps / 5).floor() * 5;
    }
    
    return baseXP + extraXP;
  }
  
  // Calculate KCAL based on sets and reps
  int calculateKCAL() {
    // Base KCAL per set is 10
    int baseKCAL = 10 * widget.sets;
    
    // Additional KCAL for every 5 reps above base (assuming base is 20)
    int baseReps = 20;
    int extraReps = widget.reps - baseReps;
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
                          _timer?.cancel();
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
                      Expanded(
                        child: Text(
                          'Custom Workout',
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 32, 32, 32),
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),

                      // Settings gear icon
                      const Icon(
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

            // Main content
            Expanded(
              child: Stack(
                children: [
                  // Regular workout content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Rest Timer label and Set counter
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Rest Timer',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              // decoration: BoxDecoration(
                              //   color: Colors.white,
                              //   borderRadius: BorderRadius.circular(8.0),
                              //   border: Border.all(color: Colors.black, width: 2.0),
                              // ),
                              child: Text(
                                'SET $_currentSet',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 16.0),
                        
                        // Timer display
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              'assets/widgets/background/frame.png',
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              _formatTime(_totalSeconds),
                              style: const TextStyle(
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        
                        const SizedBox(height: 16.0),
                        
                        // START/FINISHED button
                        GestureDetector(
                          onTap: () {
                            if (!_isFinished && _timer == null) {
                              _startTimer();
                            } else if (_isFinished) {
                              Navigator.pop(context);
                            }
                          },
                          child: Image.asset(
                            _isFinished 
                                ? 'assets/widgets/buttons/finish_buram.png'
                                : 'assets/widgets/buttons/start_button.png',
                            width: double.infinity,
                            height: 100.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Congratulations slide-up panel
                  if (_showCongrats)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: Container(
                          height: 250,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 243, 164, 41),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'CONGRATS ON FINISHING\nYOUR WORKOUT!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Dumbbell icon
                              Image.asset(
                                '/widgets/images/dumbell_image.png',
                                width: 100,
                                height: 60,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.fitness_center,
                                    size: 30,
                                    color: Colors.white,
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              // Continue button
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 200,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(0, 3),
                                        blurRadius: 0,
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'CONTINUE',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
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
          ],
        ),
      ),
    );
  }
}