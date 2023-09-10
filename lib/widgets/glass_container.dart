// ignore_for_file: must_be_immutable

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_management/utils/theme/appColors.dart';

class GlassmorphismContainer extends StatelessWidget {
  double? width;
  double? height;
  Widget? child;
  BorderRadiusGeometry? borderRadius;
  Matrix4? customTransform;
  List<Color>? colors;
  bool shadow; // متغير للتحكم في ظهور الشادو
  double shadowOffset; // متغير لتحديد حجم الشادو
  double shadowOpacity; // متغير لتحديد شفافية الشادو
  double blurRadius; // متغير لتحديد حجم الشادو
  GlassmorphismContainer({
    Key? key,
    this.width,
    this.height,
    this.child,
    this.borderRadius,
    this.customTransform,
    this.colors,
    this.shadow = true, // القيمة الافتراضية للشادو هي true
    this.shadowOffset = 1.0, // القيمة الافتراضية لحجم الشادو هي 1.0
    this.shadowOpacity = 0.2, // القيمة الافتراضية لشفافية الشادو هي 0.2
    this.blurRadius = 80.0, // القيمة الافتراضية لحجم الشادو هي 80.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius == null
                ? BorderRadius.circular(20.0)
                : borderRadius,
            boxShadow: shadow // إضافة شادو إذا كانت قيمة الشادو هي true
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(shadowOpacity),
                      spreadRadius: shadowOffset, // تحديد حجم الشادو
                      blurRadius: blurRadius,
                      blurStyle: BlurStyle.normal,
                    ),
                  ]
                : null,
          ),
        ),
        ClipRRect(
          borderRadius:
              borderRadius == null ? BorderRadius.circular(20.0) : borderRadius,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              transform: customTransform,
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colors ??
                      [
                        AppColors.accentColor.withOpacity(0.2),
                        AppColors.darkColor.withOpacity(0.2),
                      ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.015),
                      BlendMode.dstATop,
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1580243117731-a108c2953e2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  if (child == null)
                    Container()
                  else
                    Center(
                      child: child,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
