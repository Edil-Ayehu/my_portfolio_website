import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isMobile;
  const SectionTitle({
    super.key,
    required this.title,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 14 : 36.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Color(0xFFDDA512),
              fontSize: 28,
            ),
      ),
    );
  }
}
