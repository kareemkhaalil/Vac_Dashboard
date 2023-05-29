import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_management/utils/theme/appColors.dart';

class Background extends StatefulWidget {
  Background({
    this.screenHeight,
    this.screenWidth,
    this.heightUnit,
    this.widthUnit,
    this.child,
    super.key,
  });
  final double? screenHeight;
  final double? screenWidth;
  final double? heightUnit;
  final double? widthUnit;
  final Widget? child;
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    final colorTween = ColorTween(
      begin: AppColors.accentColor,
      end: AppColors.darkColor,
    );
    _colorAnimation = _animationController.drive(
      colorTween,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: widget.screenWidth,
        height: widget.screenHeight,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          _colorAnimation.value!,
                          AppColors.accentColor,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            if (widget.child != null) widget.child!, // إضافة الـ child هنا
          ],
        ),
      ),
    );
  }
}
