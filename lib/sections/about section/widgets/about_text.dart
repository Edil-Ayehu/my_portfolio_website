import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/widgets/different_color_section_title.dart';

class AboutText extends StatelessWidget {
  final bool isMobile;
  const AboutText({
    super.key,
    this.isMobile = false,
  }); 

  @override
  Widget build(BuildContext context) {
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isMobile
            ? SizedBox.shrink()
            : DifferentColorSectionTitle(
                firstText: 'About',
                secondText: 'me',
              ),
        SizedBox(height: 20),
        Text(
          "Hello, I'm Edilayehu Tadesse, a Flutter & React Developer passionate about building seamless digital experiences. I specialize in creating cross-platform mobile apps and dynamic web applications using Flutter, React, JavaScript, and Firebase. I am also eager to build mobile and web apps with seamless user experience that is user-centered. When I'm not working on exciting tech projects, you can find me watching football, learning about new technologies, or reading books.\n\nFeel free to reach out for collaborations, project inquiries, or just to say hello!",
          softWrap: true,
          overflow: TextOverflow.visible,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                letterSpacing: 1.4,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
        ),
      ],
    );
  }
}
