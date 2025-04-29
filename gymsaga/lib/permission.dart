import 'package:flutter/material.dart';
import 'dart:async';
import 'settingup.dart';

class PermissionPage extends StatelessWidget {
  const PermissionPage({Key? key}) : super(key: key);

  void _showLoadingAndNavigate(BuildContext context) {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFD4AF37)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Setting up permissions...",
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    // Close dialog and navigate after 5.3 seconds
    Timer(const Duration(milliseconds: 5300), () {
      Navigator.of(context).pop(); // Close dialog
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SettingUpScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9DEAF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const Center(
                  child: Text(
                    'ENABLE PHYSICAL ACTIVITY',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 36,
                      color: Colors.black,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Image.asset(
                    'assets/widgets/images/activity_tracker.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/widgets/images/activity_running.png',
                    width: 200,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'Please allow us to access your physical activity',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'Jersey25',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                Center(
                  child: InkWell(
                    onTap: () {
                      // Show loading and navigate
                      _showLoadingAndNavigate(context);
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
                          'ENABLE PERMISSION',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: () {
                      // Navigate directly to SettingUpScreen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingUpScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 240,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/widgets/buttons/silver_button.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Transform.translate(
                        offset: const Offset(0, -8),
                        child: const Text(
                          'NOT NOW',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
