import 'package:flutter/material.dart';
import 'package:neumorphic_timer/screens/timer_screen.dart';

void main() {
  runApp(Timer());
}

class Timer extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerScreen(),
    );
  }
}
