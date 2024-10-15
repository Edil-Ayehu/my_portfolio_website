import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/about%20section/widgets/about_section_picture.dart';
import 'package:flutter_portfolio_website/sections/about%20section/widgets/about_text.dart';
import 'package:flutter_portfolio_website/widgets/different_color_section_title.dart';

class AboutSection extends StatelessWidget {
  final bool isMobile;
  const AboutSection({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 36), // Use symmetric padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: isMobile ? size.width * 0.1 : size.width * 0.03),
          isMobile
              ? Column(
                  children: [
                    DifferentColorSectionTitle(
                      firstText: 'About', 
                      secondText: 'me',
                    ),
                    SizedBox(height: 30),
                    AboutSectionPicture(isMobile: true),
                    SizedBox(height: 45),
                    AboutText(isMobile: true),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AboutSectionPicture(),
                    SizedBox(width: 45),
                    Flexible(
                      child: AboutText(),
                    ),
                  ],
                ),
          SizedBox(height: size.width * 0.04),
        ],
      ),
    );
  }
}
