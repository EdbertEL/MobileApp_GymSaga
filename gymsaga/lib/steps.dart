import 'dart:async';
import 'dart:math';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navbar.dart';

class StepData {
  int steps;
  String status;
  bool isMoving;

  StepData({this.steps = 0, this.status = 'Resting', this.isMoving = false});

  Map<String, dynamic> toMap() {
    return {
      'steps': steps,
      'status': status,
      'isMoving': isMoving,
    };
  }

  factory StepData.fromMap(Map<String, dynamic> map) {
    return StepData(
      steps: map['steps'] ?? 0,
      status: map['status'] ?? 'Resting',
      isMoving: map['isMoving'] ?? false,
    );
  }
}

class StepsPage extends StatefulWidget {
  const StepsPage({Key? key}) : super(key: key);

  @override
  _StepsPageState createState() => _StepsPageState();
}

class _StepsPageState extends State<StepsPage> with WidgetsBindingObserver {
  StepData _stepData = StepData();
  Timer? _stepTimer;
  late SharedPreferences _prefs;
  final String _stepsKey = 'stepData';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _loadPreferences();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stepTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _loadPreferences(); // Reload when returning to page
    }
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    final String? stepDataMap = _prefs.getString(_stepsKey);
    if (stepDataMap != null) {
      Map<String, dynamic> decodedMap =
      Map<String, dynamic>.from(jsonDecode(stepDataMap));
      setState(() {
        _stepData = StepData.fromMap(decodedMap);
      });

      if (_stepData.isMoving) {
        _startTimer(); // Restart timer if walking
      }
    }
  }

  Future<void> _savePreferences() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(_stepsKey, jsonEncode(_stepData.toMap()));

  }

  void _toggleWalking() {
    if (_stepData.isMoving) {
      setState(() {
        _stepData.isMoving = false;
        _stepData.status = 'Resting';
      });
      _stepTimer?.cancel();
    } else {
      setState(() {
        _stepData.isMoving = true;
        _stepData.status = 'Walking';
      });
      _startTimer();
    }
    _savePreferences();
  }

  void _startTimer() {
    _stepTimer?.cancel(); // Clear existing timer if any
    _stepTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_stepData.isMoving) {
        final randomSteps = Random().nextInt(4) + 2;
        setState(() {
          _stepData.steps += randomSteps;
        });
        _savePreferences();
      }
    });
  }

  Widget _buildStatusWidget() {
    return Text(
      '${_stepData.steps}',
      style: const TextStyle(
        fontSize: 48,
        fontFamily: 'Jersey25',
        color: Color(0xFFFF7F11),
        shadows: [
          Shadow(
            offset: Offset(0, 4),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF7E4C3),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              height: screenHeight * 3 / 4 - 100,
              child: Image.asset(
                'assets/widgets/background/background_steps_spliced.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/widgets/background/header.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 24,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  children: [
                    Text(
                      'STEP TRACKER',
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
                      'STEP TRACKER',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Jersey25',
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 5),
                            blurRadius: 0,
                            color: Color(0x66000000),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'STEPS TODAY',
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Jersey25',
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 4),
                            color: Colors.white,
                            blurRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    _buildStatusWidget(),
                    const SizedBox(height: 8),
                    Container(
                      width: 200,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _stepData.status,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Jersey25',
                        color: _stepData.status == 'Walking'
                            ? Colors.green
                            : Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.45,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 110,
                      height: 50,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/widgets/background/run_chat_bubble.png',
                            width: 120,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                          Positioned(
                            top: 10,
                            left: 0,
                            right: 0,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${_stepData.steps}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Jersey25',
                                      color: Colors.black,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: ' steps',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Jersey25',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        _stepData.status == 'Walking'
                            ? 'assets/widgets/images/running_tracker.png'
                            : 'assets/widgets/images/running_tracker.png',
                        height: 200,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const Text(
                      'You',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Jersey25',
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 4),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleWalking,
        backgroundColor: const Color(0xFFFF7F11),
        child:
        Icon(_stepData.isMoving ? Icons.pause : Icons.play_arrow), // Toggle icon
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 1),
    );
  }
}