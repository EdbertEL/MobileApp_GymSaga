import 'package:flutter/material.dart';
import 'navbar.dart';
import 'steps.dart';
import 'profile.dart';
import 'workout.dart';
import 'finishsettingup.dart';
import 'create_workout.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This list will store scheduled workouts
  final Map<String, List<Map<String, dynamic>>> _scheduledWorkouts = {};
  
  @override
  void initState() {
    super.initState();
    // Example data - in a real app, this would come from a database or shared preferences
    _loadScheduledWorkouts();
  }
  
  void _loadScheduledWorkouts() {
    // Example data for demonstration
    _scheduledWorkouts['05/04/2025'] = [
      {'title': 'Push Day', 'xp': '+120 XP', 'exercises': 'Pushups | Pike Pushups | Dips'},
    ];
    _scheduledWorkouts['12/04/2025'] = [
      {'title': 'Legs', 'xp': '+100 XP', 'exercises': 'Squats | Lunges | Glute Bridges | Calf Rises'},
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Get the current date
    final DateTime now = DateTime.now();
    
    // Create a list of dates for April
    final List<DateTime> aprilDates = _generateAprilDates(now.year);
    
    // Find today's index in the list
    int todayIndex = aprilDates.indexWhere((date) => 
      date.day == now.day && date.month == now.month && date.year == now.year);
    if (todayIndex == -1) todayIndex = 0;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF7E3C3),
      body: SafeArea(
        child: Stack(
          children: [
            // Rest of the code remains the same until the calendar section
            
            // Checkerboard pattern background
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/widgets/background/checkerboard.png'),
                  repeat: ImageRepeat.repeat,
                ),
              ),
            ),
            
            // Decor overlay
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/widgets/background/decor_atas.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // Background Header Image
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/widgets/background/header.png',
                fit: BoxFit.cover,
              ),
            ),

            // Centered "WELCOME BACK, KATIE" Text
            Positioned(
              top: 24,
              left: 0,
              right: 0,
              child: Center(
                child: Stack(
                  children: [
                    // Text outline
                    Text(
                      'WELCOME BACK, KATIE',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Jersey25',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.black,
                      ),
                    ),
                    // Text fill with shadow
                    Text(
                      'WELCOME BACK, KATIE',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Jersey25',
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(0, 5),
                            blurRadius: 0,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Actual page content
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  
                  // Daily Quest section with frame
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/widgets/background/quest_frame.png',
                          width: double.infinity,
                        ),
                        const Positioned(
                          top: 25,
                          child: Text(
                            'Daily Quest:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9C27B0),
                              fontFamily: 'Jersey25',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // NEW: Horizontal scrollable calendar for April
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 8),
                          child: Text(
                            'April 2025',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jersey25',
                            ),
                          ),
                        ),
                        Container(
                          height: 75,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            itemCount: aprilDates.length,
                            controller: ScrollController(
                              initialScrollOffset: max(0, (todayIndex - 2) * 50.0),
                            ),
                            itemBuilder: (context, index) {
                              final date = aprilDates[index];
                              final dateString = DateFormat('dd/MM/yyyy').format(date);
                              final isToday = date.day == now.day && 
                                             date.month == now.month && 
                                             date.year == now.year;
                              final hasWorkout = _scheduledWorkouts.containsKey(dateString);

                              return _buildDayBox(
                                DateFormat('E').format(date).substring(0, 3),
                                date.day.toString(),
                                isToday,
                                hasWorkout,
                                dateString,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Reminder box
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/widgets/background/frame.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/widgets/icons/weight.png',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Don't forget to do your daily weigh in",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Jersey25',
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.close, color: Colors.black),
                      ],
                    ),
                  ),
                  
                  // Today's workouts header - Update to show the selected date's workouts
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Today's Scheduled Workouts",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jersey25',
                          color: Colors.black,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  // Scheduled workouts for today
                  ..._buildWorkoutCards(DateFormat('dd/MM/yyyy').format(now)),
                  
                  const SizedBox(height: 80),
                ],
              ),
            ),
            
            // Button create_workout di posisi fix kanan bawah
            Positioned(
              right: 20,
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateWorkoutPage()),
                  ).then((result) {
                    // If workout was scheduled, update the list
                    if (result != null && result is Map<String, dynamic>) {
                      setState(() {
                        final date = result['date'] as String;
                        if (!_scheduledWorkouts.containsKey(date)) {
                          _scheduledWorkouts[date] = [];
                        }
                        _scheduledWorkouts[date]!.add({
                          'title': result['workoutName'],
                          'xp': '+100 XP', // Default XP value
                          'exercises': result['exerciseName'],
                        });
                      });
                    }
                  });
                },
                child: Image.asset(
                  'assets/widgets/buttons/create_workout.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(currentIndex: 0),
    );
  }

  List<DateTime> _generateAprilDates(int year) {
    // Create a list of all days in April
    List<DateTime> dates = [];
    final DateTime firstDay = DateTime(year, 4, 1);
    final int daysInMonth = DateTime(year, 5, 0).day;
    
    for (int i = 0; i < daysInMonth; i++) {
      dates.add(firstDay.add(Duration(days: i)));
    }
    
    return dates;
  }

  Widget _buildDayBox(String day, String number, bool isToday, bool hasWorkout, String dateString) {
    return GestureDetector(
      onTap: () {
        // Show the workouts for this date when tapped
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Workouts for $dateString'),
            content: Container(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                children: _scheduledWorkouts.containsKey(dateString)
                    ? _scheduledWorkouts[dateString]!
                        .map((workout) => ListTile(
                              title: Text(workout['title']),
                              subtitle: Text(workout['exercises']),
                            ))
                        .toList()
                    : [
                        Center(
                          child: Text('No workouts scheduled for this day'),
                        )
                      ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: 45,
        height: 75,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/widgets/icons/date.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day.toUpperCase(),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontFamily: 'Jersey25',
                color: Colors.black,
              ),
            ),
            Text(
              number,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Jersey25',
                color: isToday ? const Color(0xFFE32020) : Colors.black,
                shadows: isToday
                    ? [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                          color: Colors.grey.withOpacity(0.7),
                        ),
                      ]
                    : [],
              ),
            ),
            if (hasWorkout)
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildWorkoutCards(String dateString) {
    if (!_scheduledWorkouts.containsKey(dateString) || 
        _scheduledWorkouts[dateString]!.isEmpty) {
      return [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/widgets/background/frame.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Text(
              'No workouts scheduled for today',
              style: TextStyle(
                fontFamily: 'Jersey25',
                fontSize: 14,
              ),
            ),
          ),
        ),
      ];
    }

    return _scheduledWorkouts[dateString]!
        .map((workout) => _buildWorkoutCard(
              context: context,
              title: workout['title'],
              xp: workout['xp'],
              exercises: workout['exercises'],
            ))
        .toList();
  }

  Widget _buildWorkoutCard({
    required BuildContext context,
    required String title,
    required String xp,
    required String exercises,
    bool showAddButton = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/widgets/background/frame.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jersey25',
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                xp,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Jersey25',
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color = Colors.white,
                                ),
                              ),
                              Text(
                                xp,
                                style: const TextStyle(
                                  color: Color(0xFF00BFFF),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Jersey25',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        exercises,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[700],
                          fontFamily: 'Jersey25',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (showAddButton)
            Positioned(
              right: 15,
              bottom: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateWorkoutPage()),
                  );
                },
                child: Image.asset(
                  'assets/widgets/buttons/create_workout.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
        ],
      ),
    );
  }
}