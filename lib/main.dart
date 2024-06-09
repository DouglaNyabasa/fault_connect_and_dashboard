import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// <<<<<<< HEAD
import 'HomePage/map_screen.dart';
import 'Reports/get_reports.dart';
import 'SplashScreen/splash_screen.dart';
import 'firebase_options.dart';
// =======
import 'fault_map_view/models/data/geojson_properties.dart';
import 'fault_map_view/views/pages/geojson_map_page.dart';
import 'package:latlong2/latlong.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
