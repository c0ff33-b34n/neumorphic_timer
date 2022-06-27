import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(231, 240, 247, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).viewPadding.top + 20),
            Row(
              children: [
                Text(
                  'Timer',
                  style: GoogleFonts.dmSans(
                    textStyle: TextStyle(
                      fontSize: 43,
                      fontWeight: FontWeight.w900,
                      color: Color.fromRGBO(49, 68, 105, 1),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              height: 145.0,
              color: Colors.green,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              height: 73.0,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
