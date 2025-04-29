// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatCaloriesPage extends StatelessWidget {
  const StatCaloriesPage({super.key});

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
              color: const Color.fromARGB(255, 228, 205, 167), // Light orange/beige background color
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
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/widgets/buttons/back_button.png',
                          width: 30.0,
                          height: 30.0,
                        ),
                      ),
                      
                      Expanded(
                        child: Center(
                          child: Text(
                            'STATISTICS',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 32, 32, 32), // Dark text color
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                      
                      // Empty SizedBox for balance
                      SizedBox(width: 30.0),
                    ],
                  ),
                  
                  // Tab Bar - Custom implementation with image backgrounds
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: 40.0,
                    child: Row(
                      children: [
                        // CALORIES tab - selected by default
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Already on this page
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/widgets/background/stat_navbar.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'CALORIES',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // WEIGHT tab
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/stat_weight');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/widgets/background/stat_navbar.png'),
                                  fit: BoxFit.fill,
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey.withOpacity(0.7), 
                                    BlendMode.modulate,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'WEIGHT',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // STEPS tab
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/stat_steps');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/widgets/background/stat_navbar.png'),
                                  fit: BoxFit.fill,
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey.withOpacity(0.7), 
                                    BlendMode.modulate,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'STEPS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        
                        // WORKOUTS tab
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/stat_workouts');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/widgets/background/stat_navbar.png'),
                                  fit: BoxFit.fill,
                                  colorFilter: ColorFilter.mode(
                                    Colors.grey.withOpacity(0.7), 
                                    BlendMode.modulate,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'WORKOUTS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.brown,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
            
            // Content - Since we removed TabBarView, only showing calories content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    caloriesBurnedTitle(),
                    daysSection(),
                    const SizedBox(height: 20.0),
                    monthsSection(),
                    const SizedBox(height: 20.0),
                    yearsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget caloriesBurnedTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Text(
          'Calories Burned',
          style: TextStyle(
            fontFamily: 'Jersey25',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
        ),
      ),
    );
  }

  Widget daysSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '7-Days',
          style: TextStyle(
            fontFamily: 'Jersey25',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/widgets/background/stat_frame.png'),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'kCal',
                  style: TextStyle(
                    fontFamily: 'Jersey25',
                    fontSize: 11,
                    color: Colors.brown[800],
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 1.5,
                child: BarChart(
                  BarChartData(
                    backgroundColor: Colors.transparent, // Ensure background is transparent
                    baselineY: 0, // Ensure bars start at 0
                    minY: 0,
                    maxY: 1000,
                    alignment: BarChartAlignment.spaceEvenly,
                    barGroups: _getDaysBarGroups(),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 200,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.brown.withOpacity(0.3),
                        strokeWidth: 1,
                        dashArray: [5, 5],
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value == 0 || value == 1000 || value % 200 != 0) return SizedBox();
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                value.toInt().toString(),
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontFamily: 'Jersey25',
                                  fontSize: 10,
                                ),
                              ),
                            );
                          },
                          reservedSize: 30,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30, // Increased to give more room
                          getTitlesWidget: (value, meta) {
                            final labels = ['28', '29', '30', '31', '1', '2', '3'];
                            final months = ['Jan', 'Feb'];
                            
                            // Only show month for day 1
                            String label = labels[value.toInt()];
                            String? month = value.toInt() == 4 ? months[0] : null;
                            
                            return Column(
                              mainAxisSize: MainAxisSize.min, // Use min size to avoid overflow
                              children: [
                                Text(
                                  label,
                                  style: TextStyle(
                                    fontFamily: 'Jersey25', 
                                    fontSize: 10,
                                    color: Colors.brown[800],
                                  ),
                                ),
                                if (month != null)
                                  Text(
                                    month,
                                    style: TextStyle(
                                      fontFamily: 'Jersey25', 
                                      fontSize: 9,
                                      color: Colors.brown[800],
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barTouchData: BarTouchData(enabled: false), // Disable touch to avoid UI issues
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget monthsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Months',
          style: TextStyle(
            fontFamily: 'Jersey25',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/widgets/background/stat_frame.png'),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'kCal in thousands (\'000)',
                  style: TextStyle(
                    fontFamily: 'Jersey25',
                    fontSize: 11,
                    color: Colors.brown[800],
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 1.5,
                child: BarChart(
                  BarChartData(
                    backgroundColor: Colors.transparent, // Ensure background is transparent
                    baselineY: 0, // Ensure bars start at 0
                    minY: 0,
                    maxY: 100,
                    alignment: BarChartAlignment.spaceEvenly,
                    barGroups: _getMonthsBarGroups(),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 25,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.brown.withOpacity(0.3),
                        strokeWidth: 1,
                        dashArray: [5, 5],
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            // Show values 0, 25, 50, 75, 100 to ensure all values are displayed
                            if (value % 25 == 0 && value <= 100) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  value.toInt().toString(),
                                  style: TextStyle(
                                    color: Colors.brown,
                                    fontFamily: 'Jersey25',
                                    fontSize: 10,
                                  ),
                                ),
                              );
                            }
                            return SizedBox();
                          },
                          reservedSize: 30,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40, // Increased height for year labels
                          getTitlesWidget: (value, meta) {
                            final labels = ['Oct', 'Nov', 'Dec', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'];
                            final years = value.toInt() >= 3 && value.toInt() <= 5 ? '2025' : '2024';
                            
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  labels[value.toInt()],
                                  style: TextStyle(
                                    fontFamily: 'Jersey25', 
                                    fontSize: 10,
                                    color: Colors.brown[800],
                                  ),
                                ),
                                if (value.toInt() == 0 || value.toInt() == 3)
                                  Text(
                                    years,
                                    style: TextStyle(
                                      fontFamily: 'Jersey25', 
                                      fontSize: 9,
                                      color: Colors.brown[800],
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barTouchData: BarTouchData(enabled: false), // Disable touch to avoid UI issues
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget yearsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Years',
          style: TextStyle(
            fontFamily: 'Jersey25',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/widgets/background/stat_frame.png'),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Workouts',
                  style: TextStyle(
                    fontFamily: 'Jersey25',
                    fontSize: 11,
                    color: Colors.brown[800],
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 1.5,
                child: BarChart(
                  BarChartData(
                    backgroundColor: Colors.transparent, // Ensure background is transparent
                    baselineY: 0, // Ensure bars start at 0
                    minY: 0,
                    maxY: 400,
                    alignment: BarChartAlignment.spaceEvenly,
                    barGroups: _getYearsBarGroups(),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: 50,
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.brown.withOpacity(0.3),
                        strokeWidth: 1,
                        dashArray: [5, 5],
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value == 0 || value == 400 || value % 50 != 0) return SizedBox();
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                value.toInt().toString(),
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontFamily: 'Jersey25',
                                  fontSize: 10,
                                ),
                              ),
                            );
                          },
                          reservedSize: 30,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 25, // Increased to give more room
                          getTitlesWidget: (value, meta) {
                            final years = ['2023', '2024', '2025'];
                            return Text(
                              years[value.toInt()],
                              style: TextStyle(
                                fontFamily: 'Jersey25', 
                                fontSize: 10,
                                color: Colors.brown[800],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barTouchData: BarTouchData(enabled: false), // Disable touch to avoid UI issues
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _getDaysBarGroups() {
    // Mengubah semua nilai menjadi 0 untuk semua batang
    final values = [210, 0, 0, 0, 0, 0, 0]; // Semua nilai 0
    return List.generate(7, (i) => 
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: values[i].toDouble(),
            fromY: 0, // Explicitly set fromY to 0
            width: 22,
            color: Colors.deepOrange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      )
    );
  }

  List<BarChartGroupData> _getMonthsBarGroups() {
    // Mengubah semua nilai menjadi 0 untuk semua batang
    final values = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]; // Semua nilai 0
    return List.generate(12, (i) => 
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: values[i].toDouble(),
            fromY: 0, // Explicitly set fromY to 0
            width: 16,
            color: Colors.deepOrange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      )
    );
  }

  List<BarChartGroupData> _getYearsBarGroups() {
    // Mengubah semua nilai menjadi 0 untuk semua batang
    final values = [0, 0, 0]; // Semua nilai 0
    return List.generate(3, (i) => 
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: values[i].toDouble(),
            fromY: 0, // Explicitly set fromY to 0
            width: 50,
            color: Colors.deepOrange,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      )
    );
  }
}