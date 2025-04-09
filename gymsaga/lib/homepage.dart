import 'package:flutter/material.dart';
import 'navbar.dart';
//import 'steps_page.dart';
//import 'profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFFEDFB6), Color(0xFFFEDFB6)],
              ),
            ),
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Header section
                Stack(
                  children: [
                    Image(
                      image: AssetImage('assets/widgets/background/header.png'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'WELCOME BACK, KATIE',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 2,
                                color: Colors.black,
                                offset: Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Daily Quest section
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                          'assets/widgets/background/decor_atas.png'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/widgets/background/quest_frame.png'),
                                width: MediaQuery.of(context).size.width * 0.9,
                              ),
                              Positioned(
                                top: 25,
                                child: Text(
                                  'Daily Quest:',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildDayBox('Sun', '2', false),
                                _buildDayBox('Mon', '3', false),
                                _buildDayBox('Tue', '4', false),
                                _buildDayBox('Wed', '5', true),
                                _buildDayBox('Thu', '6', false),
                                _buildDayBox('Fri', '7', false),
                                _buildDayBox('Sat', '8', false),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFF3D5),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.scale, color: Colors.black),
                                SizedBox(width: 10),
                                Text(
                                  "Don't forget to do your daily weigh in",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Icon(Icons.close, color: Colors.black),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 10),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Today's Scheduled Workouts",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          _buildWorkoutCard(
                            title: "Push Day",
                            xp: "+120 XP",
                            exercises: "Pushups | Pike Pushups | Dips",
                          ),
                          _buildWorkoutCard(
                            title: "Legs",
                            xp: "+120 XP",
                            exercises:
                                "Squats | Lunges | Glute Bridges | Calf Rises",
                            showAddButton: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Navbar at bottom with navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomNavBar(
              onTap: (index) {
                if (index == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                  //} else if (index == 1) {
                  //Navigator.push(context,
                  //MaterialPageRoute(builder: (context) => StepsPage()));
                  //} else if (index == 3) {
                  //Navigator.push(context,
                  //MaterialPageRoute(builder: (context) => ProfilePage()));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayBox(String day, String number, bool isSelected) {
    return Container(
      width: 35,
      height: 50,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFFFF5252) : Color(0xFFFFD54F),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day,
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          Text(number,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildWorkoutCard({
    required String title,
    required String xp,
    required String exercises,
    bool showAddButton = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFFFFF3D5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Text(xp,
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    exercises,
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            if (showAddButton)
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFFFF9800),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}