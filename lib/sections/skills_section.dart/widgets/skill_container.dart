import 'package:flutter/material.dart';

class SkillContainer extends StatelessWidget {
  final String skillName;
  final double percentage;
  final String imageUrl;
  final bool isMobile;

  const SkillContainer({
    super.key,
    required this.skillName,
    required this.percentage,
    required this.imageUrl,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image widget
          Image.asset(
            imageUrl,
            width: isMobile ? size.width * 0.07 : size.width * 0.03,
            height: isMobile ? size.width * 0.07 : size.width * 0.03,
            color: isDarkMode ? Colors.white : Color(0xFF131414),
          ),
          SizedBox(width: 10), // Spacing between image and text

          // Using Expanded to ensure flexible layout

          isMobile
              ? Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row for skill name and percentage
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Skill name
                          Flexible(
                            child: Text(
                              skillName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                          // Percentage text
                          Text(
                            '${(percentage * 100).toStringAsFixed(0)}%',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 18,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),

                      // LinearProgressIndicator for skill percentage
                      LinearProgressIndicator(
                        value: percentage, // Example: 80% skill level
                        backgroundColor:
                            isDarkMode ? Colors.grey[300] : Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 230, 193, 101),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: isMobile ? size.width * 0.5 : size.width * 0.35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(skillName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontSize: isMobile
                                        ? size.width * 0.04
                                        : size.width * 0.014,
                                  )),
                          Text(
                            '${percentage * 100}%',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: isMobile
                                      ? size.width * 0.04
                                      : size.width * 0.014,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: isMobile ? size.width * 0.5 : size.width * 0.35,
                      child: LinearProgressIndicator(
                        value: percentage, // 80% skill level
                        backgroundColor:
                            isDarkMode ? Colors.grey[300] : Colors.grey,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromARGB(255, 230, 193, 101),
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
