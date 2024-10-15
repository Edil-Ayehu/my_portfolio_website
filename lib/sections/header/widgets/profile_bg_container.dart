import 'package:flutter/material.dart';

class ProfileBgContainer extends StatelessWidget {
  const ProfileBgContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: 40,
        child: Card(
          elevation: 9,
          child: Container(
            width: size.width * 0.26,
            height: size.width * 0.26,
            decoration: BoxDecoration(
              color: isDarkMode ? Color(0xFF1C1B1F) : Color(0xFFF0F8FF),
              borderRadius: BorderRadius.circular(21),
            ),
          ),
        ),
      ),
    );
  }
}
