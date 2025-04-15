import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkoutHistoryPage extends StatefulWidget {
  const WorkoutHistoryPage({Key? key}) : super(key: key);

  @override
  State<WorkoutHistoryPage> createState() => _WorkoutHistoryPageState();
}

class _WorkoutHistoryPageState extends State<WorkoutHistoryPage> {
  DateTime _selectedMonth = DateTime.now(); // Menggunakan bulan saat ini sebagai default

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
            // Header with orange background
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
                  // Back button and title
                  Row(
                    children: [
                      // Back button
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/profile');
                        },
                        child: Image.asset(
                          'assets/widgets/buttons/back_button.png',
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),

                      const SizedBox(width: 10.0),
                      // WORKOUT HISTORY text
                      const Text(
                        'WORKOUT HISTORY',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(
                              255, 32, 32, 32), // Dark text color
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  // Underline image
                  Image.asset(
                    'assets/widgets/background/garis.png',
                    width: double.infinity,
                    height: 8.0,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),

            // Calendar Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: Column(
                  children: [
                    // Month title with navigation arrows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('MMMM yyyy').format(_selectedMonth),
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedMonth = DateTime(
                                    _selectedMonth.year,
                                    _selectedMonth.month - 1,
                                  );
                                });
                              },
                              child: const Icon(Icons.chevron_left),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedMonth = DateTime(
                                    _selectedMonth.year,
                                    _selectedMonth.month + 1,
                                  );
                                });
                              },
                              child: const Icon(Icons.chevron_right),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Calendar grid
                    _buildCalendar(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    // Days of the week header
    List<String> daysOfWeek = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

    // Get the first day of the month
    final firstDayOfMonth =
        DateTime(_selectedMonth.year, _selectedMonth.month, 1);

    // Calculate what day of the week the month starts on (0 = Monday in our case)
    int firstWeekdayOfMonth = firstDayOfMonth.weekday;
    if (firstWeekdayOfMonth == 7)
      firstWeekdayOfMonth = 0; // Convert Sunday (7) to 0

    // Get the number of days in the month
    final daysInMonth =
        DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0).day;

    // Calculate days from previous month to display
    final daysFromPreviousMonth =
        firstWeekdayOfMonth == 0 ? 6 : firstWeekdayOfMonth - 1;

    // Get the number of days in previous month
    final daysInPreviousMonth =
        DateTime(_selectedMonth.year, _selectedMonth.month, 0).day;

    // Calculate how many rows we need (including days from previous/next months)
    final totalDays = daysFromPreviousMonth + daysInMonth;
    final rowCount = (totalDays / 7).ceil();

    // Contoh data latihan (di dunia nyata, ini akan diambil dari database)
    // Format: {tanggal: 'nama workout'}
    final Map<int, String> workoutData = {
      23: 'Leg Day', // Hari ke-23 ada workout
    };

    return Column(
      children: [
        // Calendar header with days of week
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(
                255, 241, 59, 18), // Red/orange background for header row
          ),
          child: Row(
            children: daysOfWeek.map((day) {
              return Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                  ),
                  child: Text(
                    day,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        // Calendar days
        for (int i = 0; i < rowCount; i++)
          Row(
            children: List.generate(7, (dayIndex) {
              final dayNumber = i * 7 + dayIndex + 1 - daysFromPreviousMonth;

              // Determine if this day is from current month, previous month or next month
              bool isCurrentMonth = dayNumber > 0 && dayNumber <= daysInMonth;

              // Calculate the actual day to display
              int displayDay;
              Color textColor;
              Color cellColor;

              if (!isCurrentMonth) {
                if (dayNumber <= 0) {
                  // Previous month
                  displayDay = daysInPreviousMonth + dayNumber;
                  textColor = Colors.grey;
                  cellColor = const Color(
                      0xFFDCD6F7); // Light blue/gray for days not in current month
                } else {
                  // Next month
                  displayDay = dayNumber - daysInMonth;
                  textColor = Colors.grey;
                  cellColor = const Color(
                      0xFFDCD6F7); // Light blue/gray for days not in current month
                }
              } else {
                // Current month
                displayDay = dayNumber;
                textColor = Colors.black;
                cellColor = const Color(
                    0xFFFFF1D0); // Light beige for current month days
              }

              // Check if this day should have an X marker
              bool hasWorkout = isCurrentMonth && workoutData.containsKey(displayDay);
              String workoutTitle = hasWorkout ? workoutData[displayDay]! : '';

              return Expanded(
                child: Container(
                  height: 60, // Memperbesar tinggi sel dari 40 menjadi 60
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: cellColor,
                    border: Border.all(color: Colors.black, width: 0.5),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Tanggal di pojok kiri atas
                      Positioned(
                        top: 4,
                        left: 4,
                        child: Text(
                          displayDay.toString(),
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Icon X di tengah sel
                      if (hasWorkout)
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: const Color(
                                      0xFFFFE0A3), // warna kuning dari background box
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: const BorderSide(
                                      color: Colors.brown, // border gelap
                                      width: 3,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Text(
                                            workoutTitle,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              shadows: [
                                                Shadow(
                                                  offset: Offset(1.5, 1.5),
                                                  blurRadius: 1.0,
                                                  color: Colors.black38,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Exercises:',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        const Text(
                                            '• Pushups\n  Sets 3 | Reps 12\n  Active Time: none | Rest Time: 02:00'),
                                        const SizedBox(height: 6),
                                        const Text(
                                            '• Pike Pushups\n  Sets 3 | Reps 12\n  Active Time: none | Rest Time: 02:00'),
                                        const SizedBox(height: 6),
                                        const Text(
                                            '• Dips\n  Sets 2 | Reps 12\n  Active Time: none | Rest Time: 02:00'),
                                        const SizedBox(height: 12),
                                        const Text(
                                          'Monday Workout (Custom)',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 6),
                                        const Text(
                                            '• Plank\n  Sets 5 | Active Time: 00:20 | Rest Time: 02:00'),
                                        const SizedBox(height: 16),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            'assets/widgets/icons/x_wh.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
      ],
    );
  }
}