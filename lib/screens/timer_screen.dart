import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_timer/UI/neumorphic_container.dart';
import 'package:provider/provider.dart';
import '../UI/digital_colon.dart';
import '../UI/digital_number.dart';
import '../UI/neumorphic_playbutton.dart';
import '../UI/neumorphic_resetbutton.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final timerService = TimerService();
    return ChangeNotifierProvider<TimerService>(
      create: (_) => timerService,
      child: Material(
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
                child: NeumorphicPlayButton(),
              ),
              SizedBox(height: 25.0),
              NeumorphicResetButton(),
            ],
          ),
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
            final maxHeight = constraints.maxHeight;
            final maxWidth = constraints.maxWidth;
            return Container(
              height: maxHeight * 0.87,
              width: maxWidth * 0.95,
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
              child: DigitalNumbers(maxHeight: maxHeight, maxWidth: maxWidth),
            );
          },
        ),
      ),
    );
  }
}

class DigitalNumbers extends StatelessWidget {
  const DigitalNumbers({
    Key? key,
    required this.maxHeight,
    required this.maxWidth,
  }) : super(key: key);

  final double maxHeight;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final duration = Provider.of<TimerService>(context).currentDuration;
    final hours = createNumberTime(0);
    final minutes = createNumberTime(0);
    final seconds = createNumberTime(duration.inSeconds);
    return Center(
      child: Container(
        height: maxHeight * 0.5,
        width: maxWidth * 0.7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...hours,
            DigitalColon(
              height: maxHeight * 0.3,
              color: Colors.black87,
            ),
            ...minutes,
            DigitalColon(
              height: maxHeight * 0.3,
              color: Colors.black87,
            ),
            ...seconds,
          ],
        ),
      ),
    );
  }

  List<DigitalNumberWithBg> createNumberTime(int numberTime) {
    final isNumberTwoDigits = numberTime.toString().length == 2;
    final int firstDigit =
        isNumberTwoDigits ? int.parse(numberTime.toString()[0]) : 0;
    final int secondDigit =
        isNumberTwoDigits ? int.parse(numberTime.toString()[1]) : numberTime;
    return [
      DigitalNumberWithBg(
        maxHeight: maxHeight,
        value: isNumberTwoDigits ? firstDigit : 0,
      ),
      DigitalNumberWithBg(
        maxHeight: maxHeight,
        value: secondDigit,
      ),
    ];
  }
}

/// Bg stands for background
class DigitalNumberWithBg extends StatelessWidget {
  const DigitalNumberWithBg({
    Key? key,
    required this.maxHeight,
    required this.value,
  }) : super(key: key);

  final double maxHeight;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DigitalNumber(
          value: value,
          height: maxHeight * 0.3,
          color: Colors.black,
        ),
        DigitalNumber(value: 8, height: maxHeight * 0.3, color: Colors.black12),
      ],
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

class TimerService extends ChangeNotifier {
  Stopwatch _watch = Stopwatch();
  Duration _currentDuration = Duration.zero;
  Timer? _timer;
  Duration get currentDuration => _currentDuration;

  void start() {
    _watch.start();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _currentDuration = _watch.elapsed;
      notifyListeners();
    });

    notifyListeners();
  }

  void reset() {
    _watch.stop();
    _watch.reset();
    _timer?.cancel();
    _currentDuration = Duration.zero;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
}
