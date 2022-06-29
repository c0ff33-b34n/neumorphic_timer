import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;
  final double height;
  final BorderRadius? borderRadius;
  final BoxShape boxShape;

  NeumorphicContainer(
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

class _NeumorphicContainerState extends State<NeumorphicContainer> {
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
      onPointerDown: _onPointerDown,
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
