import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:project_management/utils/theme/appColors.dart';

class DrawerIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final IconData? icon;
  final String text;
  final bool drawer;
  void Function()? onTap;
  DrawerIcon(
      {super.key,
      this.width,
      required this.drawer,
      this.height,
      this.icon,
      this.onTap,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [
        Icon(
          icon,
          color: AppColors.backgroundColor,
        ),
        if (drawer)
          Padding(
            padding: EdgeInsets.only(left: width! * 0.02),
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.backgroundColor,
                fontSize: height! * 0.02,
              ),
            ),
          ),
      ]),
    );
  }
}
