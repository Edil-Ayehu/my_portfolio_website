import 'package:flutter/material.dart';

class DifferentColorSectionTitle extends StatelessWidget {
  final String firstText;
  final String secondText;
  final bool isUnderlined;
  const DifferentColorSectionTitle({
    super.key,
    required this.firstText,
    required this.secondText,
    this.isUnderlined = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Text(
          firstText,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: isDarkMode ? Color(0xFfE6E6E6) : Color(0xFF131414),
                fontSize: 28,
              ),
        ),
        SizedBox(width: 10),
        Text(
          secondText,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Color(0xFFDDA512),
                fontSize: 28,
                decoration: isUnderlined
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
        ),
      ],
    );
  }
}
