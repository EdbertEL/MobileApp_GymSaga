import 'package:flutter/material.dart';
import 'activitypersonalization.dart'; // Impor file ActivityPersonalization

class WeightGoal extends StatefulWidget {
  const WeightGoal({super.key});
  @override
  WeightGoalState createState() => WeightGoalState();
}

class WeightGoalState extends State<WeightGoal> {
  final TextEditingController _weightController = TextEditingController();

  void _navigateToActivityPersonalization() {
    // Pastikan ada validasi untuk berat
    if (_weightController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ActivityPersonalization()), // Gunakan kelas dari activitypersonalization.dart
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9DEAF),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'What\'s your target',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Jersey25',
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'weight?',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Jersey25',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                _buildMeasurementField(
                  label: 'Your Weight',
                  hintText: 'Your Weight',
                  unit: 'KG',
                  icon: Icons.monitor_weight_outlined,
                  controller: _weightController,
                ),
                const SizedBox(height: 30),
                Center(
                  child: InkWell(
                    onTap: _weightController.text.isNotEmpty
                        ? _navigateToActivityPersonalization
                        : null,
                    child: Opacity(
                      opacity: _weightController.text.isNotEmpty ? 1.0 : 0.5,
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
                            'CONFIRM',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Jersey25',
                            ),
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
      ),
    );
  }

  Widget _buildMeasurementField({
    required String label,
    required String hintText,
    required String unit,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Icon(icon, color: Colors.grey),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFFF9800),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'KG',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
