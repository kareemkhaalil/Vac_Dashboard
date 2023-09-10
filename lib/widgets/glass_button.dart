// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project_management/widgets/glass_container.dart';

class GlassmorphismButton extends StatefulWidget {
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
    this.textColor = Colors.white,
  }) : super(key: key);

  final double blurRadius;
  final BorderRadiusGeometry? borderRadius;
  final List<Color>? colors;
  final Matrix4? customTransform;
  final double? height;
  final VoidCallback onPressed;
  final bool shadow;
  final double shadowOffset;
  final double shadowOpacity;
  final String text;
  final Color textColor;
  final double? width;

  @override
  _GlassmorphismButtonState createState() => _GlassmorphismButtonState();
}

class _GlassmorphismButtonState extends State<GlassmorphismButton> {
  bool isHovered = false;
  bool isPressed = false;

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
          duration: const Duration(milliseconds: 200),
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
                  color: widget.textColor,
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
