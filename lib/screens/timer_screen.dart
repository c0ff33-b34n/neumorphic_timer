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
            SizedBox(height: MediaQuery.of(context).viewPadding.top),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Timer',
                  style: GoogleFonts.roboto(
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
            )
          ],
        ),
      ),
    );
  }
}
