import 'package:flutter/material.dart';

class StatWeightPage extends StatefulWidget {
  const StatWeightPage({Key? key}) : super(key: key);

  @override
  State<StatWeightPage> createState() => _StatWeightPageState();
}

class _StatWeightPageState extends State<StatWeightPage> {
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
                        // CALORIES tab
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/stat_calories');
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
                                  'CALORIES',
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
                        
                        // WEIGHT tab - selected by default
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
                                  'WEIGHT',
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

            // Content area for weight statistics - new implementation
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title with jersey25 font for weight tracking - UPDATED to match stat_steps.dart
                    weightGainLossTitle(),
                    
                    // 7-Day Chart
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                            child: Text(
                              '7-Days',
                              style: TextStyle(
                                fontFamily: 'Jersey25',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown[800],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('widgets/background/stat_frame.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            height: 200.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Y-axis label
                                Container(
                                  margin: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    'Kg',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                
                                // Chart area
                                Expanded(
                                  child: CustomPaint(
                                    size: Size(double.infinity, 150),
                                    painter: SevenDayChartPainter(),
                                  ),
                                ),
                                
                                // X-axis labels
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildDateLabel('28\nJan'),
                                      _buildDateLabel('29'),
                                      _buildDateLabel('30'),
                                      _buildDateLabel('31'),
                                      _buildDateLabel('1\nFeb'),
                                      _buildDateLabel('2'),
                                      _buildDateLabel('3\nToday'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Months Chart
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                            child: Text(
                              'Months',
                              style: TextStyle(
                                fontFamily: 'Jersey25',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown[800],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('widgets/background/stat_frame.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            height: 200.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Y-axis label
                                Container(
                                  margin: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    'Kg',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                
                                // Chart area
                                Expanded(
                                  child: CustomPaint(
                                    size: Size(double.infinity, 150),
                                    painter: MonthChartPainter(),
                                  ),
                                ),
                                
                                // X-axis labels with padding to prevent overflow
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      _buildMonthLabel('Oct'),
                                      _buildMonthLabel('Nov'),
                                      _buildMonthLabel('Dec'),
                                      _buildMonthLabel('Jan'),
                                      _buildMonthLabel('Feb'),
                                      _buildMonthLabel('Mar'),
                                      _buildMonthLabel('Apr'),
                                      _buildMonthLabel('May'),
                                      _buildMonthLabel('Jun'),
                                      _buildMonthLabel('Jul'),
                                      _buildMonthLabel('Aug'),
                                      _buildMonthLabel('Sep'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Years Chart
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                            child: Text(
                              'Years',
                              style: TextStyle(
                                fontFamily: 'Jersey25',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown[800],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('widgets/background/stat_frame.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            padding: const EdgeInsets.all(12.0),
                            height: 200.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Y-axis label
                                Container(
                                  margin: const EdgeInsets.only(bottom: 4.0),
                                  child: Text(
                                    'Kg',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                
                                // Chart area
                                Expanded(
                                  child: CustomPaint(
                                    size: Size(double.infinity, 150),
                                    painter: YearChartPainter(),
                                  ),
                                ),
                                
                                // X-axis labels
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      _buildYearLabel('2023'),
                                      _buildYearLabel('2024'),
                                      _buildYearLabel('2025'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
    );
  }

  // NEW FUNCTION to match the statStepsTitle() in stat_steps.dart
  Widget weightGainLossTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Center(
        child: Text(
          'Weight Gain/Loss',
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

  Widget _buildDateLabel(String text) {
    return Container(
      width: 30,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10.0,
          color: Colors.black87,
        ),
      ),
    );
  }
  
  Widget _buildMonthLabel(String text) {
    return Container(
      width: 25,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10.0,
          color: Colors.black87,
        ),
      ),
    );
  }
  
  Widget _buildYearLabel(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 10.0,
        color: Colors.black87,
      ),
    );
  }
}

// Custom painter for 7-day weight chart
class SevenDayChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFAAAAAA)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Draw horizontal grid lines
    final double horizontalSpacing = size.height / 3;
    for (int i = 0; i < 4; i++) {
      final double y = i * horizontalSpacing;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint..color = Colors.brown.withOpacity(0.3)..strokeCap = StrokeCap.round..strokeWidth = 1.0
      );
    }

    // Draw data points and connecting line
    final pointPaint = Paint()
      ..color = Colors.blue.shade300
      ..strokeWidth = 6.0
      ..style = PaintingStyle.fill;
    
    final linePaint = Paint()
      ..color = Colors.blue.shade300
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    
    // 7 days data points - all at 0 (bottom of chart)
    final daySpacing = size.width / 6;
    final pointsData = [
      Offset(0, size.height), // 28 Jan
      Offset(daySpacing, size.height), // 29 Jan
      Offset(daySpacing * 2, size.height), // 30 Jan
      Offset(daySpacing * 3, size.height), // 31 Jan
      Offset(daySpacing * 4, size.height), // 1 Feb
      Offset(daySpacing * 5, size.height), // 2 Feb
      Offset(daySpacing * 6, size.height), // 3 Feb
    ];
    
    // Draw connecting line
    final path = Path();
    path.moveTo(pointsData[0].dx, pointsData[0].dy);
    for (int i = 1; i < pointsData.length; i++) {
      path.lineTo(pointsData[i].dx, pointsData[i].dy);
    }
    canvas.drawPath(path, linePaint);
    
    // Draw points
    for (var point in pointsData) {
      canvas.drawCircle(point, 3.0, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for month weight chart
class MonthChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFAAAAAA)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Draw horizontal grid lines
    final double horizontalSpacing = size.height / 3;
    for (int i = 0; i < 4; i++) {
      final double y = i * horizontalSpacing;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint..color = Colors.brown.withOpacity(0.3)..strokeCap = StrokeCap.round..strokeWidth = 1.0
      );
    }

    // Draw data points and connecting line
    final pointPaint = Paint()
      ..color = Colors.blue.shade300
      ..strokeWidth = 6.0
      ..style = PaintingStyle.fill;
    
    final linePaint = Paint()
      ..color = Colors.blue.shade300
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    
    // Monthly data points - all at 0 (bottom of chart)
    final monthSpacing = size.width / 11;
    final pointsData = [
      Offset(0, size.height), // Oct
      Offset(monthSpacing, size.height), // Nov
      Offset(monthSpacing * 2, size.height), // Dec
      Offset(monthSpacing * 3, size.height), // Jan
      Offset(monthSpacing * 4, size.height), // Feb
      Offset(monthSpacing * 5, size.height), // Mar
      Offset(monthSpacing * 6, size.height), // Apr
      Offset(monthSpacing * 7, size.height), // May
      Offset(monthSpacing * 8, size.height), // Jun
      Offset(monthSpacing * 9, size.height), // Jul
      Offset(monthSpacing * 10, size.height), // Aug
      Offset(monthSpacing * 11, size.height), // Sep
    ];
    
    // Draw connecting line
    final path = Path();
    path.moveTo(pointsData[0].dx, pointsData[0].dy);
    for (int i = 1; i < pointsData.length; i++) {
      path.lineTo(pointsData[i].dx, pointsData[i].dy);
    }
    canvas.drawPath(path, linePaint);
    
    // Draw points
    for (var point in pointsData) {
      canvas.drawCircle(point, 3.0, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom painter for year weight chart
class YearChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFAAAAAA)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Draw horizontal grid lines
    final double horizontalSpacing = size.height / 3;
    for (int i = 0; i < 4; i++) {
      final double y = i * horizontalSpacing;
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint..color = Colors.brown.withOpacity(0.3)..strokeCap = StrokeCap.round..strokeWidth = 1.0
      );
    }

    // Draw data points and connecting line
    final pointPaint = Paint()
      ..color = Colors.blue.shade300
      ..strokeWidth = 6.0
      ..style = PaintingStyle.fill;
    
    final linePaint = Paint()
      ..color = Colors.blue.shade300
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    
    // Yearly data points - all at 0 (bottom of chart)
    final yearSpacing = size.width / 2;
    final pointsData = [
      Offset(0, size.height), // 2023
      Offset(yearSpacing, size.height), // 2024
      Offset(yearSpacing * 2, size.height), // 2025
    ];
    
    // Draw connecting line
    final path = Path();
    path.moveTo(pointsData[0].dx, pointsData[0].dy);
    for (int i = 1; i < pointsData.length; i++) {
      path.lineTo(pointsData[i].dx, pointsData[i].dy);
    }
    canvas.drawPath(path, linePaint);
    
    // Draw points
    for (var point in pointsData) {
      canvas.drawCircle(point, 3.0, pointPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}