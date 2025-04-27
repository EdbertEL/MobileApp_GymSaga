import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsOn = true;
  bool soundOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E4C3),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFF7E4C3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 3),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          'assets/widgets/buttons/back_button.png',
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Text(
                          'SETTINGS',
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Jersey25',
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.black,
                          ),
                        ),
                        const Text(
                          'SETTINGS',
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'Jersey25',
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                offset: Offset(0, 5),
                                blurRadius: 0,
                                color: Colors.black54,
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

            const SizedBox(height: 24),

            // Email and Username Frame
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/widgets/background/frame.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email text
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontFamily: 'Jersey25',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2), // Reduced vertical spacing

                    // Brown line separator
                    Container(
                      height: 2,
                      color: const Color(0xFF8B4513), // Brown color
                    ),

                    const SizedBox(height: 2), // Reduced vertical spacing

                    // Username text
                    const Text(
                      'Username',
                      style: TextStyle(
                        fontFamily: 'Jersey25',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),            const SizedBox(height: 24),

            // Preferences Title
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'PREFERENCES',
                  style: TextStyle(
                    fontFamily: 'Jersey25',
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Notifications Setting
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/widgets/background/frame.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      fontFamily: 'Jersey25',
                      fontSize: 20,
                    ),
                  ),
                  Switch(
                    value: notificationsOn,
                    activeColor: Colors.orange,
                    onChanged: (value) {
                      setState(() {
                        notificationsOn = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Sound after finishing a set
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/widgets/background/frame.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: Text(
                      'Sound after finishing a set',
                      style: TextStyle(
                        fontFamily: 'Jersey25',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Switch(
                    value: soundOn,
                    activeColor: Colors.orange,
                    onChanged: (value) {
                      setState(() {
                        soundOn = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            const Spacer(),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 320,
                    height: 70,
                    child: Image.asset(
                      'assets/widgets/buttons/silver_button.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  // Silver button background image

                  Positioned(
                    top: 6,
                    child: Text(
                      'DELETE ACCOUNT',
                      style: TextStyle(
                        fontFamily: 'Jersey25',
                        fontSize: 24,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}