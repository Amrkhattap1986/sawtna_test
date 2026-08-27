import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AlbyStarApp());
}

class AlbyStarApp extends StatelessWidget {
  const AlbyStarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alby star',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'sans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7B61FF),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
