import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    super.key,
    this.isMobile = false,
  });

  final bool isMobile;

  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.linkedin),
          color: isDarkMode ? Color(0xFfE6E6E6) : Color(0xFF131414),
          iconSize: isMobile ? size.width * 0.09 : size.width * 0.03,
          onPressed: () => _launchURL(
              'https://www.linkedin.com/in/edilayehu-tadesse-ab4652278/'),
        ),
        SizedBox(width: 20),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.telegram),
          color: isDarkMode ? Color(0xFfE6E6E6) : Color(0xFF131414),
          iconSize: isMobile ? size.width * 0.09 : size.width * 0.03,
          onPressed: () => _launchURL('https://t.me/edilayehu'),
        ),
        SizedBox(width: 20),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.instagram),
          color: isDarkMode ? Color(0xFfE6E6E6) : Color(0xFF131414),
          iconSize: isMobile ? size.width * 0.09 : size.width * 0.03,
          onPressed: () => _launchURL('https://www.instagram.com/edil.ayehu/'),
        ),
      ],
    );
  }
}
