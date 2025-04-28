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

            // Content area for weight statistics - keeping the existing content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Current weight and BMI card
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4.0,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildWeightDisplay('68.5', 'Current Weight', 'kg'),
                              Container(
                                height: 80.0,
                                width: 1.0,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              _buildWeightDisplay('22.4', 'BMI', ''),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.green),
                            ),
                            child: const Text(
                              'Healthy Weight Range',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Weight trend chart
                    Container(
                      margin: const EdgeInsets.only(bottom: 20.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4.0,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Weight Trend',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Time filter dropdown/selector
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  children: [
                                    const Text(
                                      '3 Months',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 4.0),
                                    Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey.shade700,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          // Placeholder for chart
                          Container(
                            height: 200.0,
                            width: double.infinity,
                            color: Colors.grey.withOpacity(0.2),
                            child: const Center(
                              child: Text('Weight Trend Line Chart'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Weight progress stats
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4.0,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Progress Stats',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          // Stats grid
                          Row(
                            children: [
                              Expanded(child: _buildProgressStat('Starting Weight', '72.5 kg')),
                              Expanded(child: _buildProgressStat('Goal Weight', '65.0 kg')),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(child: _buildProgressStat('Weight Lost', '-4.0 kg')),
                              Expanded(
                                child: _buildProgressStat('Remaining', '-3.5 kg',
                                    progressColor: Colors.blue),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          // Progress bar
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Progress to Goal',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '53%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                height: 12.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: 0.53,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [Colors.blue.shade300, Colors.blue.shade700],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
  
  Widget _buildWeightDisplay(String value, String label, String unit) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4.0),
            Text(
              unit,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
  
  Widget _buildProgressStat(String label, String value, {Color progressColor = Colors.green}) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: progressColor,
            ),
          ),
        ],
      ),
    );
  }
}