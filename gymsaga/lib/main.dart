import 'package:flutter/material.dart';
import 'package:gymsaga/achievement.dart';
import 'package:gymsaga/activitypersonalization.dart';
import 'package:gymsaga/login.dart';
import 'package:gymsaga/profile.dart';
import 'package:gymsaga/register.dart';
import 'package:gymsaga/homepage.dart';
import 'package:gymsaga/splashscreen.dart';
import 'package:gymsaga/steps.dart';
import 'package:gymsaga/workout.dart';
import 'package:gymsaga/stat_calories.dart';
import 'package:gymsaga/stat_weight.dart';
import 'package:gymsaga/stat_steps.dart';
import 'package:gymsaga/stat_workouts.dart';
//import 'firebase_options.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Jersey25',
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            // Menghilangkan animasi untuk semua platform
            TargetPlatform.android: NoAnimationTransitionBuilder(),
            TargetPlatform.iOS: NoAnimationTransitionBuilder(),
            TargetPlatform.fuchsia: NoAnimationTransitionBuilder(),
            TargetPlatform.linux: NoAnimationTransitionBuilder(),
            TargetPlatform.macOS: NoAnimationTransitionBuilder(),
            TargetPlatform.windows: NoAnimationTransitionBuilder(),
          },
        ),
      ),
      initialRoute: '/splash',  // Changed this line
      routes: {
        '/splash': (context) => const SplashScreen(),  // Added this line
        '/home': (context) => const HomePage(),  // Added this line
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/profile': (context) => const ProfilePage(),
        '/steps': (context) => const StepsPage(),
        '/workout': (context) => const WorkoutPage(),
        '/stat_calories': (context) => const StatCaloriesPage(),
        '/stat_weight': (context) => const StatWeightPage(),
        '/stat_steps': (context) => const StatStepsPage(),
        '/stat_workouts': (context) => const StatWorkoutsPage(),
      },
      onGenerateRoute: (settings) {
        // Also update the onGenerateRoute to handle '/home' route
        if (settings.arguments is Map &&
            (settings.arguments as Map).containsKey('noAnimation') &&
            (settings.arguments as Map)['noAnimation'] == true) {
          Widget page;
          switch (settings.name) {
            case '/home':  // Changed this line
              page = const HomePage();
              break;
            case '/login':
              page = const LoginPage();
              break;
            // other routes...
            default:
              page = const HomePage();
          }

          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => page,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          );
        }

        return null;
      },
    );
  }
}

// Custom transition builder tanpa animasi
class NoAnimationTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
