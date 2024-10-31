import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool isMobile;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.isMobile = false,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    // Responsive width calculation
    double cardWidth;
    if (widget.isMobile) {
      cardWidth = size.width - 40; // Full width minus padding
    } else {
      // For web, calculate based on screen size
      if (size.width > 1200) {
        cardWidth = 360; // Fixed width for large screens
      } else if (size.width > 800) {
        cardWidth = (size.width - 100) / 3; // 3 cards per row
      } else {
        cardWidth = (size.width - 80) / 2; // 2 cards per row
      }
    }

    return Padding(
      padding: EdgeInsets.all(10),
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: cardWidth,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isDarkMode
                ? (isHovered ? Colors.grey[900] : Colors.grey[850])
                : (isHovered ? Colors.white : Colors.grey[50]),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: isDarkMode
                    ? Colors.black.withOpacity(0.3)
                    : Colors.grey.withOpacity(0.2),
                blurRadius: isHovered ? 15 : 10,
                offset: Offset(0, isHovered ? 8 : 5),
              ),
            ],
            border: Border.all(
              color: isHovered ? Color(0xFFDDA512) : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFDDA512),
                      Color(0xFFD4940F),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFDDA512).withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(
                  widget.icon,
                  size: widget.isMobile ? 30 : 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: widget.isMobile ? 18 : 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: widget.isMobile ? 14 : 16,
                  color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
