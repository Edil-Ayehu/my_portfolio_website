import 'package:flutter/material.dart';

class AboutSectionPicture extends StatelessWidget {
  final bool isMobile;
  const AboutSectionPicture({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) { 
    final size = MediaQuery.of(context).size;
    return Container(
      width: isMobile ? size.width * 0.9 : size.width * 0.32,
      height: isMobile ? size.width * 0.9 : size.width * 0.32,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0xFFF0F8FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/images/edil.jpg',
          fit: BoxFit.cover, // Ensure the image covers the container
        ),
      ),
    );
  }
}
