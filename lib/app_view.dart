import 'package:fintrack/screens/home/views/homescreen.dart';
import 'package:flutter/material.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinTrack',
      theme: ThemeData(
          colorScheme: ColorScheme.light(
              surface: Colors.grey.shade100,
              onSurface: Colors.black,
              primary: const Color(0xFF02f09c),
              secondary: const Color(0xFF00d7bf),
              tertiary: const Color(0xFF00bae0))),
      home: HomeScreen(),
    );
  }
}
