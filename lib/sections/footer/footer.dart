import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;

class Footer extends StatelessWidget {
  final bool isMobile;
  const Footer({
    super.key,
    this.isMobile = false,
  });

  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Container(
      // height: isMobile ? size.height * 0.2 : size.height * 0.4,
      width: double.infinity,
      color: isDarkMode ? Color(0xFF131414) : Color(0xFFe6e6e6),

      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => _launchURL(
                    'https://www.linkedin.com/in/edilayehu-tadesse-ab4652278/'),
                icon: FaIcon(
                  FontAwesomeIcons.linkedin,
                  size: isMobile ? size.width * 0.08 : size.width * 0.03,
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () => _launchURL('https://t.me/edilayehu'),
                icon: FaIcon(
                  FontAwesomeIcons.telegram,
                  size: isMobile ? size.width * 0.08 : size.width * 0.03,
                ),
              ),
              SizedBox(width: 20),
              IconButton(
                onPressed: () =>
                    _launchURL('https://www.instagram.com/edil.ayehu/'),
                icon: FaIcon(
                  FontAwesomeIcons.instagram,
                  size: isMobile ? size.width * 0.08 : size.width * 0.03,
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: isMobile ? size.width * 0.22 : size.width * 0.12,
                height: 2,
                color: Colors.grey.shade800,
              ),
              SizedBox(width: 10),
              Text(
                '//',
                style: TextStyle(
                  fontSize: isMobile ? size.width * 0.04 : size.width * 0.02,
                  color: Colors.grey.shade800,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: isMobile ? size.width * 0.22 : size.width * 0.12,
                height: 2,
                color: Colors.grey.shade800,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Copyright 2024. All Rights Reserved',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isDarkMode ? Color(0xFFE6E6E6) : Color(0xFF131414),
                  fontSize: isMobile ? size.width * 0.04 : size.width * 0.013,
                  letterSpacing: 1.4,
                ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
