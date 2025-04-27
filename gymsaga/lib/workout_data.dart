library workout_data;

import 'package:flutter/material.dart';

// Updated global list to store completed workouts with all necessary details
List<Map<String, dynamic>> completedWorkouts = [];

// Helper function to format current date as dd/MM/yyyy
String getCurrentFormattedDate() {
  final now = DateTime.now();
  return "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year}";
}

// Helper function to parse date string (handles different formats)
DateTime? parseDateString(String dateStr) {
  // Handle "Today" case
  if (dateStr == "Today") {
    return DateTime.now();
  }
  
  // Handle dd/MM/yyyy format
  if (dateStr.contains('/')) {
    try {
      final parts = dateStr.split('/');
      if (parts.length == 3) {
        return DateTime(
          int.parse(parts[2]),  // Year
          int.parse(parts[1]),  // Month
          int.parse(parts[0]),  // Day
        );
      }
    } catch (e) {
      print('Error parsing date: $dateStr');
    }
  }
  
  // Try direct parsing as fallback
  try {
    return DateTime.parse(dateStr);
  } catch (e) {
    print('Failed to parse date: $dateStr');
    return null;
  }
}