import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;

class Footer extends StatelessWidget {
  final bool isMobile;
  const Footer({super.key, this.isMobile = false});

  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode
              ? [Color(0xFF1A1A1A), Color(0xFF262626)]
              : [Color(0xFFF5F5F5), Color(0xFFE8E8E8)],
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ? 30 : 50,
              horizontal: isMobile ? 20 : 50,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: isDarkMode ? Colors.white12 : Colors.black12,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                // Social Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSocialIcon(
                      icon: FontAwesomeIcons.linkedin,
                      url:
                          'https://www.linkedin.com/in/edilayehu-tadesse-ab4652278/',
                      isDarkMode: isDarkMode,
                      size: size,
                    ),
                    SizedBox(width: isMobile ? 20 : 30),
                    _buildSocialIcon(
                      icon: FontAwesomeIcons.telegram,
                      url: 'https://t.me/edilayehu',
                      isDarkMode: isDarkMode,
                      size: size,
                    ),
                    SizedBox(width: isMobile ? 20 : 30),
                    _buildSocialIcon(
                      icon: FontAwesomeIcons.instagram,
                      url: 'https://www.instagram.com/edil.ayehu/',
                      isDarkMode: isDarkMode,
                      size: size,
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 30 : 40),
                // Divider with logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDivider(isDarkMode, size, isMobile),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'ET',
                        style: TextStyle(
                          fontSize: isMobile ? 18 : 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFDDA512),
                        ),
                      ),
                    ),
                    _buildDivider(isDarkMode, size, isMobile),
                  ],
                ),
                SizedBox(height: isMobile ? 30 : 40),
                // Copyright text
                Text(
                  'Copyright © 2024 | All Rights Reserved',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                    fontSize: isMobile ? 14 : 16,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon({
    required IconData icon,
    required String url,
    required bool isDarkMode,
    required Size size,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(url),
        child: Container(
          padding: EdgeInsets.all(isMobile ? 12 : 16),
          decoration: BoxDecoration(
            color: isDarkMode
                ? Colors.white.withOpacity(0.05)
                : Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDarkMode ? Colors.white12 : Colors.black12,
              width: 1,
            ),
          ),
          child: FaIcon(
            icon,
            size: isMobile ? size.width * 0.05 : size.width * 0.018,
            color: Color(0xFFDDA512),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider(bool isDarkMode, Size size, bool isMobile) {
    return Container(
      width: isMobile ? size.width * 0.2 : size.width * 0.15,
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isDarkMode ? Colors.white24 : Colors.black12,
            isDarkMode ? Colors.white12 : Colors.black.withOpacity(0.05),
          ],
        ),
      ),
    );
  }
}
