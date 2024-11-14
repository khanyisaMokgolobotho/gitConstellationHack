import 'package:flutter/material.dart';
import 'pages/main_screen.dart'; // Make sure the path is correct
// import 'pages/report_screen.dart';  // Ensure this file exists
// import 'pages/community_chat_screen.dart';  // Ensure this file exists

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(), // Directly calling MainScreen as the home page
    );
  }
}
