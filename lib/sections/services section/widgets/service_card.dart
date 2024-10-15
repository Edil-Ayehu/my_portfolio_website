import 'package:flutter/material.dart';
import 'dart:math'; // Import this for the constant `pi`

class ServiceCard extends StatelessWidget {
  final String label;
  final bool isMobile;
  const ServiceCard({
    super.key,
    required this.label,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: isMobile ? 20 : 0),
      padding: EdgeInsets.symmetric(
          vertical: isMobile ? size.width * 0.06 : 0,
          horizontal: isMobile ? 0 : 20),
      child: Transform.rotate(
        angle: -pi / 4, // Rotate by -45 degrees (π/4 radians)
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: isMobile ? size.width * 0.4 : size.width * 0.2,
            height: isMobile ? size.width * 0.4 : size.width * 0.2,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Color(0xFFE6E6E6), // Border color
                width: 1.0, // Border width
              ),
            ),
            child: Card(
              elevation: 7,
              color: isDarkMode ? Color(0xFf131414) : Color(0xFFE6E6E6),
              child: Center(
                child: Transform.rotate(
                  angle: pi / 4,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      label,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                      textAlign:
                          TextAlign.center, // Center text inside the Card
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
