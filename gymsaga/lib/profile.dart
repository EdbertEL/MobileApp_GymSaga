import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E4C3),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile image
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(
                      'assets/widgets/images/female_profile.png',
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Centered name using Expanded
                  Expanded(
                    child: Center(
                      child: Text(
                        'Katie'
                      ),
                    ),
                  ),

                  // Edit button on the right
                  Image.asset(
                    'assets/widgets/buttons/edit_button.png',
                    width: 28,
                    height: 28,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Stat Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ProfileStat(
                    label: 'Start Weight',
                    value: '60.4 KG',
                  ),
                  ProfileStat(
                    label: 'Goal',
                    value: '50.0 KG',
                  ),
                  ProfileStat(
                    label: 'Daily Calories',
                    value: '594 kcal',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Action Buttons
            const ProfileButton(label: 'My Weight', icon: Icons.monitor_weight),
            const ProfileButton(
                label: 'Workout History', icon: Icons.fitness_center),
            const ProfileButton(label: 'Statistics', icon: Icons.show_chart),
            const ProfileButton(
                label: 'Achievements', icon: Icons.emoji_events),
          ],
        ),
      ),
    );
  }
}

class ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const ProfileStat({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/widgets/background/profile_frame.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const ProfileButton({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/widgets/background/frame.png',
            fit: BoxFit.none, // Prevent stretching
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(icon, size: 20),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.chevron_right),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
