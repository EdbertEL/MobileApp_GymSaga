import 'package:flutter/material.dart';
import 'package:gymsaga/create_workout.dart';

class CreateExercisePage extends StatefulWidget {
  const CreateExercisePage({super.key});

  @override
  State<CreateExercisePage> createState() => _CreateExercisePageState();
}

class _CreateExercisePageState extends State<CreateExercisePage> {
  final TextEditingController _setsController =
      TextEditingController(text: '0');
  final TextEditingController _repsController =
      TextEditingController(text: '0');
  final TextEditingController _activeTimeController =
      TextEditingController(text: '00:00');
  final TextEditingController _restTimeController =
      TextEditingController(text: '00:00');

  final TextEditingController _exerciseNameController = TextEditingController();

  int _sets = 0;
  int _reps = 0;
  int _activeSeconds = 0;
  int _restSeconds = 0;

  String _formatDuration(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _incrementSets() {
    setState(() {
      _sets++;
      _setsController.text = _sets.toString();
    });
  }

  void _incrementReps() {
    setState(() {
      _reps++;
      _repsController.text = _reps.toString();
    });
  }

  void _incrementActiveTime() {
    setState(() {
      _activeSeconds += 10; // Tambah 10 detik
      _activeTimeController.text = _formatDuration(_activeSeconds);
    });
  }

  void _incrementRestTime() {
    setState(() {
      _restSeconds += 10; // Tambah 10 detik
      _restTimeController.text = _formatDuration(_restSeconds);
    });
  }

  void _decrementSets() {
    setState(() {
      if (_sets > 0) {
        _sets--;
        _setsController.text = _sets.toString();
      }
    });
  }

  void _decrementReps() {
    setState(() {
      if (_reps > 0) {
        _reps--;
        _repsController.text = _reps.toString();
      }
    });
  }

  void _decrementActiveTime() {
    setState(() {
      if (_activeSeconds >= 10) {
        _activeSeconds -= 10;
        _activeTimeController.text = _formatDuration(_activeSeconds);
      }
    });
  }

  void _decrementRestTime() {
    setState(() {
      if (_restSeconds >= 10) {
        _restSeconds -= 10;
        _restTimeController.text = _formatDuration(_restSeconds);
      }
    });
  }

  @override
  void dispose() {
    _setsController.dispose();
    _repsController.dispose();
    _activeTimeController.dispose();
    super.dispose();
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
                    // CREATE Exercise text
                    const Expanded(
                      child: Text(
                        'Create Exercise',
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
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Exercise Name",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                child: TextField(
                                  controller: _exerciseNameController,
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Background frame image
                              Image.asset(
                                'assets/widgets/background/frame_half.png',
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sets:",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: _decrementSets,
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Image.asset(
                                              'assets/widgets/buttons/button_min.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 40,
                                            child: TextField(
                                              textAlign: TextAlign.center,
                                              controller: _setsController,
                                              readOnly: true,
                                              decoration: const InputDecoration(
                                                hintText: '....',
                                                border: OutlineInputBorder(),
                                                fillColor: Colors.white,
                                                filled: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12.0,
                                                        vertical: 8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: _incrementSets,
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                              'assets/widgets/buttons/button_plus.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 32.0,
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Background frame image
                              Image.asset(
                                'assets/widgets/background/frame_half.png',
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Reps:",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: _decrementReps,
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Image.asset(
                                              'assets/widgets/buttons/button_min.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 40,
                                            child: TextField(
                                              controller: _repsController,
                                              textAlign: TextAlign.center,
                                              decoration: const InputDecoration(
                                                hintText: '....',
                                                border: OutlineInputBorder(),
                                                fillColor: Colors.white,
                                                filled: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12.0,
                                                        vertical: 8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: _incrementReps,
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                              'assets/widgets/buttons/button_plus.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Background frame image
                              Image.asset(
                                'assets/widgets/background/frame_half.png',
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Active Time: m/s",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: _decrementActiveTime,
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Image.asset(
                                              'assets/widgets/buttons/button_min.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 40,
                                            child: TextField(
                                              controller: _activeTimeController,
                                              textAlign: TextAlign.center,
                                              readOnly: true,
                                              decoration: const InputDecoration(
                                                hintText: '....',
                                                border: OutlineInputBorder(),
                                                fillColor: Colors.white,
                                                filled: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12.0,
                                                        vertical: 8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: _incrementActiveTime,
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                              'assets/widgets/buttons/button_plus.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 32.0,
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Background frame image
                              Image.asset(
                                'assets/widgets/background/frame_half.png',
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),

                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 18),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Rest Time: m/s",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: _decrementRestTime,
                                          child: SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Image.asset(
                                              'assets/widgets/buttons/button_min.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: 40,
                                            child: TextField(
                                              readOnly: true,
                                              textAlign: TextAlign.center,
                                              controller: _restTimeController,
                                              decoration: const InputDecoration(
                                                hintText: '....',
                                                border: OutlineInputBorder(),
                                                fillColor: Colors.white,
                                                filled: true,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 12.0,
                                                        vertical: 8.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: _incrementRestTime,
                                          child: SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                              'assets/widgets/buttons/button_plus.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_exerciseNameController.text.isNotEmpty) {
                          Navigator.pop(context, {
                            'exerciseName': _exerciseNameController.text,
                            'sets': _setsController.text,
                            'reps': _repsController.text,
                            'activeTime': _activeTimeController.text,
                            'restTime': _restTimeController.text,
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Please enter the exercise name first.'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      child: SizedBox(
                        child: Image.asset(
                          'assets/widgets/buttons/add_to_workout.png',
                          fit: BoxFit.fill,
                          width: double.infinity,
                          filterQuality: FilterQuality.none,
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
    ));
  }
}
