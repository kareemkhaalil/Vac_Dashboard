import 'package:flutter/material.dart';
import 'package:project_management/widgets/glass_container.dart';

class GlassmorphismTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final double? width;
  final double? height;

  const GlassmorphismTextFormField({
    Key? key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.width,
    this.height,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphismContainer(
      width: width, // تحديد عرض الحاوية حسب الحاجة
      height: height, // تحديد ارتفاع الحاوية حسب الحاجة
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(color: Colors.white), // تغيير لون النص
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white), // تغيير لون العنوان
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.4),
          ), // تغيير لون النص التلميح
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), // إضافة حدود بلون معين
            borderRadius: BorderRadius.circular(24),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.white), // تغيير لون الحدود عند التركيز
            borderRadius: BorderRadius.circular(24),
          ),

          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        cursorColor: Colors.white, // تغيير لون المؤشر
      ),
    );
  }
}
