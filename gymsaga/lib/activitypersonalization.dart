import 'package:flutter/material.dart';
import 'finishsettingup.dart';

class ActivityPersonalization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9DEAF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'What\'s your activity level?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildActivityButton(
                  context,
                  'assets/widgets/images/activity_level_1.png',
                  'I sit in my desk all day',
                ),
                const SizedBox(height: 20),
                _buildActivityButton(
                  context,
                  'assets/widgets/images/activity_level_2.png',
                  'I walk ocasionally for 30m',
                ),
                const SizedBox(height: 20),
                _buildActivityButton(
                  context,
                  'assets/widgets/images/activity_level_3.png',
                  'I spend at least an hour working out',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityButton(
    BuildContext context,
    String imagePath,
    String text,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FinishSettingUp()),
        );
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('assets/widgets/buttons/golden_button.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Image.asset(
              imagePath,
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
