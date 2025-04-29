import 'package:flutter/material.dart';
import 'weightgoal.dart';

class FemaleProfile extends StatelessWidget {
  const FemaleProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9DEAF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'What\'s your goal?',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Jersey25',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 4.0,
                          color: Color.fromARGB(150, 0, 0, 0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Image.asset(
                      'assets/widgets/images/female_lose_weight.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildButton('LOSE WEIGHT', context),
                  const SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      'assets/widgets/images/female_build_muscle.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildButton('BUILD MUSCLE', context),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WeightGoal()),
          );
        },
        child: Container(
          height: 50,
          width: 240,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/widgets/buttons/golden_button.png'),
              fit: BoxFit.fill,
            ),
          ),
          alignment: Alignment.center,
          child: Transform.translate(
            offset: const Offset(0, -8),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Jersey25',
                letterSpacing: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
