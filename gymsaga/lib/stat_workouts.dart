import 'package:flutter/material.dart';

class StatWorkoutsPage extends StatelessWidget {
  const StatWorkoutsPage({super.key});

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
                        
                        // WORKOUTS tab - selected by default
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
                                  'WORKOUTS',
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

            // Content area for workouts statistics
            const Expanded(
              child: Center(
                child: Text('Workouts Statistics Page (Coming Soon)', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}