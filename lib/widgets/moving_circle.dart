import 'package:flutter/material.dart';

class MovingGlowCircle extends StatefulWidget {
  final Color color;
  final double blurRadius;

  MovingGlowCircle({required this.color, required this.blurRadius});

  @override
  _MovingGlowCircleState createState() => _MovingGlowCircleState();
}

class _MovingGlowCircleState extends State<MovingGlowCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Positioned(
          top: _controller.value * MediaQuery.of(context).size.height,
          left: _controller.value * MediaQuery.of(context).size.width,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color.withOpacity(0.5),
              boxShadow: [
                BoxShadow(
                  color: widget.color,
                  blurRadius: widget.blurRadius,
                  spreadRadius: 2.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
