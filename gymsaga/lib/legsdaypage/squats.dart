import 'package:flutter/material.dart';
import '../navbar.dart';
import '../components/exercisecard.dart';
import '../components/exercisedetailcard.dart';
import '../components/exercisetimer.dart';
import 'lunges.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class SquatsPage extends StatefulWidget {
  const SquatsPage({super.key});

  @override
  State<SquatsPage> createState() => _SquatsPageState();
}

class _SquatsPageState extends State<SquatsPage> {
  bool showExerciseDetail = false;
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDay = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    DateTime tempSelectedDay = _selectedDay;

    await showDialog(
      context: context,
      builder: (context) {
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
                  focusedDay: tempSelectedDay,
                  selectedDayPredicate: (day) =>
                      isSameDay(tempSelectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _dateController.text =
                          DateFormat('dd/MM/yyyy').format(selectedDay);
                    });
                    Navigator.pop(context);
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: const BoxDecoration(
                      color: Color(0xFFFF9900),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: const BoxDecoration(
                      color: Color(0xFFFF9900),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                      'Leg Day',
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
                      'Leg Day',
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
                  if (showExerciseDetail) {
                    setState(() {
                      showExerciseDetail = false;
                    });
                  } else {
                    Navigator.of(context).pop();
                  }
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
                  ? SingleChildScrollView(
                      child: ExerciseDetailCard(
                        title: 'Squats',
                        imagePath: 'assets/widgets/images/squats.png',
                        description:
                            'Keep your chest up and back straight\nGo deep to engage glutes and hamstrings\nAvoid letting knees go past toes',
                        reps: '3 x 15',
                        onStart: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ExerciseTimerPage(
                                onContinue: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const LungesPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
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
            buildExerciseCard(
              title: 'Squats – 3 x 15 Reps',
              onTap: () {
                setState(() {
                  showExerciseDetail = true;
                });
              },
            ),
            const SizedBox(height: 10),
            buildExerciseCard(title: 'Lunges – 3 x 12 Reps'),
            const SizedBox(height: 10),
            buildExerciseCard(title: 'Wall Sit – 60s x 2'),
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
                image: const DecorationImage(
                  image: AssetImage('assets/widgets/background/frame.png'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(8),
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
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Workout scheduled!")),
                );
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

  Widget buildExerciseCard({required String title, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/widgets/background/frame.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            Image.asset(
              'assets/widgets/images/barbel.png',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Jersey25',
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
