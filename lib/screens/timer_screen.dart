import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_timer/UI/neumorphic_container.dart';

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
                HamburgerButton(),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            DigitalClock(),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: PlayButton(),
            ),
            SizedBox(height: 25.0),
            ResetButton(),
          ],
        ),
      ),
    );
  }
}

class DigitalClock extends StatelessWidget {
  const DigitalClock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 230, 243, 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-10, -10),
            blurRadius: 15,
          ),
          BoxShadow(
            color: Color.fromRGBO(214, 223, 230, 1),
            offset: Offset(10, 10),
            blurRadius: 15,
          ),
        ],
      ),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: constraints.maxHeight * 0.87,
              width: constraints.maxWidth * 0.95,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromRGBO(203, 211, 196, 1),
                  Color.fromRGBO(176, 188, 163, 1),
                ]),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color.fromRGBO(168, 168, 168, 1),
                  width: 2,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      key: key,
      child: Center(
        child: Icon(
          Icons.play_arrow,
          size: 60,
          color: Colors.greenAccent.shade400,
        ),
      ),
      bevel: 5.0,
      borderRadius: null,
      boxShape: BoxShape.circle,
      color: Color.fromRGBO(227, 237, 247, 1),
      height: 1.0,
    );
  }
}

class HamburgerButton extends StatelessWidget {
  const HamburgerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      color: Color.fromRGBO(227, 237, 247, 1),
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (var i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.5),
                child: Container(
                  height: 1.3,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(1),
                    ),
                    boxShadow: [
                      // Edge shadow
                      BoxShadow(
                        offset: Offset(-1, -1),
                        color: Color.fromRGBO(176, 193, 209, 1),
                        spreadRadius: 1.0,
                      ),
                      // Circular shadow
                      BoxShadow(
                        color: Colors.white,
                        // spreadRadius: 0.5,
                      )
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
      bevel: 5.0,
      height: 55,
      key: key,
    );
  }
}

class ResetButton extends StatefulWidget {
  const ResetButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ResetButton> createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicContainer(
      child: Text(
        'Reset',
        textAlign: TextAlign.center,
        style: GoogleFonts.dmSans(
          textStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(49, 68, 105, 1),
          ),
        ),
      ),
      bevel: 5.0,
      borderRadius: BorderRadius.circular(10.5),
      color: Color.fromRGBO(227, 237, 247, 1),
      key: widget.key,
      height: 80.0,
    );
  }
}
