import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;

class SocialIcons extends StatefulWidget {
  const SocialIcons({
    super.key,
    this.isMobile = false,
  });

  final bool isMobile;

  @override
  State<SocialIcons> createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  void _launchURL(String url) {
    html.window.open(url, '_blank');
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  Widget _buildAnimatedIcon(IconData icon, String url) {
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: IconButton(
          icon: FaIcon(icon),
          // ... existing icon properties ...
          onPressed: () => _launchURL(url),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment:
          widget.isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        _buildAnimatedIcon(FontAwesomeIcons.linkedin,
            'https://www.linkedin.com/in/edilayehu-tadesse-ab4652278/'),
        SizedBox(width: 20),
        _buildAnimatedIcon(FontAwesomeIcons.telegram, 'https://t.me/edilayehu'),
        SizedBox(width: 20),
        _buildAnimatedIcon(FontAwesomeIcons.instagram,
            'https://www.instagram.com/edil.ayehu/'),
      ],
    );
  }
}
