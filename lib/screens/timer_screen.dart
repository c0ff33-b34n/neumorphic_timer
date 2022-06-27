import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(231, 240, 247, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'timer',
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
