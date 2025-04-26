import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart'; // <--- Tambahin ini buat kalender custom
import '../navbar.dart';
import '../components/exercisecard.dart';
import '../components/exercisedetailcard.dart';
import '../components/exercisetimer.dart';
import 'russiantwist.dart';

class PlankPage extends StatefulWidget {
  const PlankPage({super.key});

  @override
  State<PlankPage> createState() => _PlankPageState();
}

class _PlankPageState extends State<PlankPage> {
  bool showExerciseDetail = false;
  final TextEditingController _dateController = TextEditingController();

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
                      title: 'Plank',
                      imagePath: 'assets/widgets/images/plank.png',
                      description:
                          'Activate your core muscles\nStrict form, no cheating\nAvoid rounding up your back',
                      reps: '60s x 2',
                      onStart: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExerciseTimerPage(
                              onContinue: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RussianTwistPage(),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    )
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
            ExerciseCard(
              title: 'Plank – 60s x4',
              onTap: () {
                setState(() {
                  showExerciseDetail = true;
                });
              },
            ),
            const SizedBox(height: 10),
            const ExerciseCard(title: 'Russian Twist – 3 x 15 Reps'),
            const SizedBox(height: 10),
            const ExerciseCard(title: 'Leg Raises – 3 x 12 Reps'),
            const SizedBox(height: 10),
            const ExerciseCard(title: 'Mountain Climbers – 4 x 15 Reps'),
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
                  width: 340,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/widgets/buttons/golden_button.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  alignment: const Alignment(0, -0.8),
                  child: const Text(
                    'START',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 38,
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
            const Text(
              'Schedule Workout:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Stack(
              children: [
                Image.asset(
                  'assets/widgets/background/frame.png',
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _dateController,
                          decoration: const InputDecoration(
                            hintText: 'Choose date...',
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
                      GestureDetector(
                        onTap: () => _selectDate(context),
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
            GestureDetector(
              onTap: () {
                if (_dateController.text.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "Workout scheduled for ${_dateController.text}!")),
                  );
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/widgets/buttons/schedule.png',
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        DateTime selectedDay = DateTime.now();

        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFF7E4C3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Pick a Date',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Jersey25',
                    color: Color(0xFFFF9900),
                  ),
                ),
                const SizedBox(height: 12),
                TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime(2101),
                  focusedDay: DateTime.now(),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: const Color(0xFFFF9900),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: const Color(0xFFFF9900),
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jersey25',
                      fontSize: 18,
                    ),
                    selectedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jersey25',
                      fontSize: 18,
                    ),
                    defaultTextStyle: const TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 16,
                    ),
                    weekendTextStyle: const TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: const TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 20,
                      color: Color(0xFFFF9900),
                    ),
                    leftChevronIcon: const Icon(
                      Icons.chevron_left,
                      color: Color(0xFFFF9900),
                    ),
                    rightChevronIcon: const Icon(
                      Icons.chevron_right,
                      color: Color(0xFFFF9900),
                    ),
                  ),
                  onDaySelected: (selectedDayTemp, focusedDay) {
                    setState(() {
                      selectedDay = selectedDayTemp;
                      _dateController.text =
                          '${selectedDay.day}/${selectedDay.month}/${selectedDay.year}';
                    });
                    Navigator.pop(context);
                  },
                  selectedDayPredicate: (day) {
                    return isSameDay(day, selectedDay);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
