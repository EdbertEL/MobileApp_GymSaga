import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<String> _navIcons = [
    'assets/widgets/buttons/navbar_home.png',
    'assets/widgets/buttons/navbar_steps.png',
    'assets/widgets/buttons/navbar_workout.png',
    'assets/widgets/buttons/navbar_profile.png',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/widgets/buttons/home_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: List.generate(_navIcons.length, (index) {
    return Expanded( // Tambahkan ini agar setiap item memiliki ruang yang cukup
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        child: Image.asset(
          _navIcons[index],
          width: 60, // Pastikan tidak terlalu besar
          height: 60,
          fit: BoxFit.contain, // Hindari gambar melebihi batas
        ),
      ),
    );
  }),
),

            ),
          ),
        ],
      ),
    );
  }
}
