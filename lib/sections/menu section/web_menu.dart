import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/export.dart';
import 'package:flutter_portfolio_website/sections/menu%20section/animated_menu_item.dart';

class WebMenu extends StatelessWidget {
  final String activeSection;
  final Function(GlobalKey) onSectionTap;
  final Map<String, GlobalKey> sectionKeys;
  final VoidCallback onThemeToggle;
  final bool isDarkMode;

  const WebMenu({
    super.key,
    required this.activeSection,
    required this.onSectionTap,
    required this.sectionKeys,
    required this.onThemeToggle,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: isDarkMode ? Color(0xFF131414) : Color(0xFFE6E6E6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildMenuItem('HOME', Icons.home, sectionKeys['Home']!),
                    _buildMenuItem(
                        'ABOUT', Icons.person, sectionKeys['About']!),
                    _buildMenuItem('SERVICES', Icons.design_services,
                        sectionKeys['Services']!),
                    _buildMenuItem(
                        'PORTFOLIO', Icons.work, sectionKeys['Portfolio']!),
                    _buildContactButton(sectionKeys['Contact']!),
                    SizedBox(width: 16),
                    IconButton(
                      icon:
                          Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                      onPressed: onThemeToggle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon, GlobalKey key) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: AnimatedMenuItem(
        title: title,
        icon: icon,
        isActive: activeSection == title,
        onTap: () => onSectionTap(key),
      ),
    );
  }

  Widget _buildContactButton(GlobalKey key) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton.icon(
        icon: Icon(Icons.send),
        label: Text('CONTACT ME'),
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarkMode ? Color(0xFFDDA512) : Color(0xFF131414),
          foregroundColor: Color(0xFFE6E6E6),
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => onSectionTap(key),
      ),
    );
  }
}
