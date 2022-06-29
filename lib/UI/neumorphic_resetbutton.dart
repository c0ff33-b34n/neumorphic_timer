import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../screens/timer_screen.dart';

class NeumorphicResetButton extends StatefulWidget {
  const NeumorphicResetButton({
    Key? key,
  }) : super(key: key);

  @override
  State<NeumorphicResetButton> createState() => _ResetButtonState();
}

class _ResetButtonState extends State<NeumorphicResetButton> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicResetContainer(
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

class NeumorphicResetContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final double height;
  final BorderRadius? borderRadius;
  final BoxShape boxShape;

  NeumorphicResetContainer(
      {required Key? key,
      required this.child,
      this.bevel = 10.0,
      required this.color,
      required this.height,
      required this.borderRadius,
      this.boxShape = BoxShape.rectangle})
      : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicResetContainerState createState() =>
      _NeumorphicResetContainerState();
}

class _NeumorphicResetContainerState extends State<NeumorphicResetContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = this.widget.color;

    return Listener(
      onPointerDown: (e) {
        Provider.of<TimerService>(context, listen: false).reset();
        _onPointerDown(e);
      },
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        alignment: Alignment.center,
        height: widget.height,
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          shape: widget.boxShape,
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _isPressed ? color : color.mix(Colors.black, .1),
                _isPressed ? color.mix(Colors.black, .05) : color,
                _isPressed ? color.mix(Colors.black, .05) : color,
                color.mix(Colors.white, _isPressed ? .2 : .5),
              ],
              stops: [
                0.0,
                .3,
                .6,
                1.0,
              ]),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    blurRadius: widget.bevel,
                    offset: -widget.blurOffset,
                    color: Colors.white,
                  ),
                  BoxShadow(
                    blurRadius: widget.bevel,
                    offset: widget.blurOffset,
                    color: color.mix(Colors.black, .3),
                  )
                ],
        ),
        child: widget.child,
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount)!;
  }
}
