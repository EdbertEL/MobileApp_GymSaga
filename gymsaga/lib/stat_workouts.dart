import 'package:flutter/material.dart';

class StatWorkoutsPage extends StatelessWidget {
  const StatWorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E4C3),
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
              padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
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
                        'STATISTICS',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 32, 32, 32),
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  // Navbar
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    height: 40,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/widgets/background/stat_navbar.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNavButton(context, 'CALORIES'),
                        _buildNavButton(context, 'WEIGHT'),
                        _buildNavButton(context, 'STEPS'),
                        _buildNavButton(context, 'WORKOUTS', isActive: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Image.asset(
                    'assets/widgets/background/garis.png',
                    width: double.infinity,
                    height: 8,
                    fit: BoxFit.fitWidth,
                  ),
                ],
              ),
            ),
            // Dummy Content
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

  Widget _buildNavButton(BuildContext context, String text, {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        if (text == 'CALORIES') {
          Navigator.pushReplacementNamed(context, '/stat_calories');
        } else if (text == 'WEIGHT') {
          Navigator.pushReplacementNamed(context, '/stat_weight');
        } else if (text == 'STEPS') {
          Navigator.pushReplacementNamed(context, '/stat_steps');
        }
        // Tidak navigasi kalau WORKOUTS, karena sudah aktif
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.black.withOpacity(0.6),
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
