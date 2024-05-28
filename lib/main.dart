import 'package:flutter/material.dart';

import 'HomePage/map_screen.dart';
import 'Reports/get_reports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MapScreen(),
    );
  }
}


