// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project_management/widgets/glass_container.dart';

class GlassmorphismButton extends StatefulWidget {
  final double? width;
  final double? height;
  final String text;
  final VoidCallback onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Matrix4? customTransform;
  final List<Color>? colors;
  final bool shadow;
  final double shadowOffset;
  final double shadowOpacity;
  final double blurRadius;

  const GlassmorphismButton({
    Key? key,
    this.width,
    this.height,
    required this.text,
    required this.onPressed,
    this.borderRadius,
    this.customTransform,
    this.colors,
    this.shadow = true,
    this.shadowOffset = 1.0,
    this.shadowOpacity = 0.2,
    this.blurRadius = 80.0,
  }) : super(key: key);

  @override
  _GlassmorphismButtonState createState() => _GlassmorphismButtonState();
}

class _GlassmorphismButtonState extends State<GlassmorphismButton> {
  bool isPressed = false;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true; // تحديث حالة دخول المؤشر
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false; // تحديث حالة خروج المؤشر
        });
      },
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            isPressed = true; // تحديث حالة الضغط
          });
        },
        onTapUp: (_) {
          setState(() {
            isPressed = false; // تحديث حالة رفع الضغط
          });
          widget.onPressed(); // استدعاء الدالة المرتبطة بالضغط
        },
        onTapCancel: () {
          setState(() {
            isPressed = false; // تحديث حالة إلغاء الضغط
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: isPressed
              ? widget.width! * 0.95
              : widget.width, // تحديث عرض الحاوية بناءً على حالة الضغط
          height: isPressed
              ? widget.height! * 0.95
              : widget.height, // تحديث ارتفاع الحاوية بناءً على حالة الضغط
          child: GlassmorphismContainer(
            width: widget.width,
            height: widget.height,
            borderRadius: widget.borderRadius,
            customTransform: widget.customTransform,
            colors: widget.colors,
            shadow: isHovered & isPressed
                ? widget.shadow
                : false, // تحديث حالة الشادو بناءً على حالة دخول المؤشر أو الضغط
            shadowOffset: widget.shadowOffset,
            shadowOpacity: widget.shadowOpacity,
            blurRadius: widget.blurRadius,
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Raleway",
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
