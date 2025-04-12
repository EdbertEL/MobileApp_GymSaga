import 'package:flutter/material.dart';
import 'package:gymsaga/homepage.dart';
import 'package:gymsaga/login.dart';
import 'package:gymsaga/profile.dart';
import 'package:gymsaga/register.dart';
import 'homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Jersey25',
      ),
      home: ProfilePage(),
    );
  }
}
