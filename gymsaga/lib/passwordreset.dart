import 'package:flutter/material.dart';

class PasswordResetPage extends StatelessWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9DEAF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              const Text(
                'Check your email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Jersey25',
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Your password has been successfully reset. Click confirm to set a new password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Jersey25',
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 340,
                    height: 70,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/widgets/buttons/golden_button.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Transform.translate(
                      offset: const Offset(0, -13), // Geser dikit ke atas
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontFamily: 'Jersey25',
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
