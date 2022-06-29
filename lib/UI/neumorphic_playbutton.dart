import 'package:flutter/material.dart';
import 'package:neumorphic_timer/screens/timer_screen.dart';
import 'package:provider/provider.dart';

class NeumorphicPlayButton extends StatelessWidget {
  const NeumorphicPlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicPlayContainer(
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

class NeumorphicPlayContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final double height;
  final BorderRadius? borderRadius;
  final BoxShape boxShape;

  NeumorphicPlayContainer(
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
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicPlayContainer> {
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
        Provider.of<TimerService>(context, listen: false).start();
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
