import 'package:flutter/material.dart';
import 'package:project_management/utils/theme/screen_size.dart';
import 'package:project_management/widgets/glass_button.dart';
import 'package:project_management/widgets/glass_container.dart';

class GlassAlert extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onPressed;

  const GlassAlert({
    Key? key,
    required this.errorMessage,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = getScreenSize(context);
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GlassmorphismContainer(
          width: screenSize.width * 0.6,
          height: screenSize.height * 0.1,
          child: Center(
            child: Column(
              children: [
                Text(
                  errorMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Raleway",
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                GlassmorphismButton(
                  text: 'Ok',
                  onPressed: onPressed,
                  height: screenSize.height * 0.05,
                  width: screenSize.width * 0.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
