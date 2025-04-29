import 'package:flutter/material.dart';
import 'login.dart';

class FinishSettingUp extends StatelessWidget {
  const FinishSettingUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9DEAF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Thank you!',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Jersey25',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Your personalized plan is currently being cooked up.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16, // Reduced from 20
                      fontFamily: 'Jersey25', // Changed from Inter
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Image.asset(
                      'assets/widgets/images/cooking.png',
                      width: 180, // Reduced from 250
                      height: 180, // Reduced from 250
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: InkWell(
                      onTap: () {
                        // Navigate directly to LoginPage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 240,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/widgets/buttons/golden_button.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Transform.translate(
                          offset: const Offset(0, -8),
                          child: const Text(
                            'CONTINUE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
                              fontFamily: 'Jersey25',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
