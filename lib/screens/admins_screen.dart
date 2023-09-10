import 'package:flutter/material.dart';

class AdminsScreen extends StatelessWidget {
  const AdminsScreen({
    this.height,
    this.width,
    this.heightUnit,
    this.widthUnit,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;
  final double? heightUnit;
  final double? widthUnit;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Admins Screen',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
