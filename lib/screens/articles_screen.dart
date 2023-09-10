import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({
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
        'Articles Screen',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
