import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gymsaga/workout_data.dart'; // Ganti your_project_name

class WorkoutHistoryPage extends StatefulWidget {
  const WorkoutHistoryPage({Key? key}) : super(key: key);

  @override
  State<WorkoutHistoryPage> createState() => _WorkoutHistoryPageState();
}

class _WorkoutHistoryPageState extends State<WorkoutHistoryPage> {
  DateTime _selectedMonth = DateTime.now(); // Default bulan ini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/widgets/background/checkerboard.png'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              color: const Color.fromARGB(255, 228, 205, 167),
              padding: const EdgeInsets.only(
                  top: 40, left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/profile');
                        },
                        child: Image.asset(
                          'assets/widgets/buttons/back_button.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'WORKOUT HISTORY',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 32, 32, 32),
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 20,
                    child: Image.asset(
                      'assets/widgets/background/garis.png',
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.none,
                    ),
                  ),
                ],
              ),
            ),

            // Kalender
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('MMMM yyyy').format(_selectedMonth),
                          style: const TextStyle(
                            fontSize: 24,
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
    List<String> daysOfWeek = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

    final firstDayOfMonth =
        DateTime(_selectedMonth.year, _selectedMonth.month, 1);
    int firstWeekdayOfMonth = firstDayOfMonth.weekday;
    if (firstWeekdayOfMonth == 7) firstWeekdayOfMonth = 0;

    final daysInMonth =
        DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0).day;
    final daysFromPreviousMonth =
        firstWeekdayOfMonth == 0 ? 6 : firstWeekdayOfMonth - 1;
    final daysInPreviousMonth =
        DateTime(_selectedMonth.year, _selectedMonth.month, 0).day;
    final totalDays = daysFromPreviousMonth + daysInMonth;
    final rowCount = (totalDays / 7).ceil();

    // Ubah dari Map<DateTime, String> menjadi Map<DateTime, List<Map<String, dynamic>>>
    // untuk menyimpan semua workout pada tanggal yang sama
    final Map<DateTime, List<Map<String, dynamic>>> workoutData = {};

    for (var workout in completedWorkouts) {
      try {
        final dateStr = workout['date'] as String;
        DateTime date;

        // Check if the date is "Today"
        if (dateStr == "Today") {
          date = DateTime.now(); // Use current date
        }
        // Check if the date format contains '/' separators
        else if (dateStr.contains('/')) {
          final parts = dateStr.split('/');
          if (parts.length >= 3) {
            date = DateTime(
              int.parse(parts[2]), // Year
              int.parse(parts[1]), // Month
              int.parse(parts[0]), // Day
            );
          } else {
            continue; // Skip this workout if date format is invalid
          }
        } else {
          // Try to parse the date directly
          date = DateTime.parse(dateStr);
        }

        // Normalize the date to remove time component
        date = DateTime(date.year, date.month, date.day);

        // Initialize list if it doesn't exist
        if (!workoutData.containsKey(date)) {
          workoutData[date] = [];
        }
        
        // Add workout to the list for this date
        workoutData[date]!.add(workout);
      } catch (e) {
        print('Error parsing date for workout: ${workout['workoutName']}');
        print('Date string: ${workout['date']}');
        print('Error: $e');
        // Continue with the next workout instead of crashing
      }
    }

    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 241, 59, 18),
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

        // Isi kalender
        for (int i = 0; i < rowCount; i++)
          Row(
            children: List.generate(7, (dayIndex) {
              final dayNumber = i * 7 + dayIndex + 1 - daysFromPreviousMonth;
              bool isCurrentMonth = dayNumber > 0 && dayNumber <= daysInMonth;

              int displayDay;
              Color textColor;
              Color cellColor;

              if (!isCurrentMonth) {
                if (dayNumber <= 0) {
                  displayDay = daysInPreviousMonth + dayNumber;
                  textColor = Colors.grey;
                  cellColor = const Color(0xFFDCD6F7);
                } else {
                  displayDay = dayNumber - daysInMonth;
                  textColor = Colors.grey;
                  cellColor = const Color(0xFFDCD6F7);
                }
              } else {
                displayDay = dayNumber;
                textColor = Colors.black;
                cellColor = const Color(0xFFFFF1D0);
              }

              DateTime thisDay = DateTime(
                  _selectedMonth.year, _selectedMonth.month, displayDay);
              bool hasWorkout =
                  isCurrentMonth && workoutData.containsKey(thisDay);
              List<Map<String, dynamic>> workouts = 
                  hasWorkout ? workoutData[thisDay]! : [];

              return Expanded(
                child: Container(
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: cellColor,
                    border: Border.all(color: Colors.black, width: 0.5),
                  ),
                  child: Stack(
                    children: [
                      // Tanggal tetap tampil di kiri atas
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
                      // X di tengah jika ada workout
                      if (hasWorkout)
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return _buildWorkoutDialog(workouts);
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/widgets/icons/x_wh.png',
                              width: 24,
                              height: 24,
                            ),
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

  Widget _buildWorkoutDialog(List<Map<String, dynamic>> workouts) {
    if (workouts.isEmpty) {
      return Dialog(
        backgroundColor: const Color(0xFFFFE0A3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.brown, width: 3),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Workout Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  shadows: [
                    Shadow(
                        offset: Offset(1.5, 1.5),
                        blurRadius: 1,
                        color: Colors.black38)
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text("No details available for this workout"),
              SizedBox(height: 16),
            ],
          ),
        ),
      );
    }

    return Dialog(
      backgroundColor: const Color(0xFFFFE0A3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.brown, width: 3),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  "Completed Workouts",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    shadows: [
                      Shadow(
                          offset: Offset(1.5, 1.5),
                          blurRadius: 1,
                          color: Colors.black38)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Loop through all workouts for this date
              for (int i = 0; i < workouts.length; i++) ...[
                if (i > 0) const Divider(thickness: 2, color: Colors.brown),
                
                Text(
                  workouts[i]['workoutName'] ?? 'Unnamed Workout',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Exercises:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Display exercises for this workout
                if (workouts[i].containsKey('exercises') && 
                    workouts[i]['exercises'] is List && 
                    (workouts[i]['exercises'] as List).isNotEmpty)
                  ...List<Map<String, dynamic>>.from(workouts[i]['exercises'])
                      .map((exercise) => Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(
                              '• ${exercise['exerciseName'] ?? 'Unnamed Exercise'}\n'
                              '  Sets ${exercise['sets'] ?? 'N/A'} | Reps ${exercise['reps'] ?? 'N/A'}\n'
                              '  Active Time: ${exercise['activityTime'] ?? 'N/A'} | Rest Time: ${exercise['restTime'] ?? 'N/A'}',
                            ),
                          ))
                      .toList()
                else
                  const Text('No exercises available for this workout'),
                
                const SizedBox(height: 12),
              ],
              
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}