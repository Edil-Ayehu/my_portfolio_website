import 'dart:async';

import 'package:flutter_portfolio_website/export.dart';

class AboutText extends StatefulWidget {
  final bool isMobile;
  const AboutText({super.key, this.isMobile = false});

  @override
  State<AboutText> createState() => _AboutTextState();
}

class _AboutTextState extends State<AboutText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final String aboutMeText =
      '''Hello, I'm Edilayehu Tadesse, a passionate Flutter developer with a keen eye for creating beautiful and functional mobile applications and websites. I specialize in cross-platform development using Flutter and have experience in building responsive, user-friendly interfaces.

My journey in software development has equipped me with:
• Strong expertise in Flutter and Dart programming
• Experience in building responsive web applications
• Knowledge of UI/UX design principles
• Proficiency in state management solutions
• Version control with Git

I'm constantly learning and staying updated with the latest technologies to deliver modern, efficient solutions. My goal is to create impactful digital experiences that make a difference.'''; // Your existing text

  bool get _isMounted => mounted;
  String _displayText = '';
  Timer? _timer;
  int _currentIndex = 0;
  bool get shouldAnimate => !widget.isMobile;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    // Only start typing animation for web layout
    if (shouldAnimate) {
      _startTypingAnimation();
    } else {
      _displayText = aboutMeText; // Show full text immediately on mobile
    }
  }

  void _startTypingAnimation() {
    const speed = Duration(milliseconds: 30);
    _timer = Timer.periodic(speed, (timer) {
      if (_currentIndex < aboutMeText.length && _isMounted) {
        setState(() {
          _displayText = aboutMeText.substring(0, _currentIndex + 1);
          _currentIndex++;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.isMobile) ...[
          // DifferentColorSectionTitle(
          //   firstText: 'About',
          //   secondText: 'me',
          // ),
          // SizedBox(height: 20),
        ],
        FadeTransition(
          opacity: _fadeAnimation,
          child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  shouldAnimate ? _displayText : aboutMeText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        letterSpacing: 1.2,
                        height: 1.6,
                        fontWeight: FontWeight.w500,
                        fontSize: widget.isMobile ? 16 : 18,
                      ),
                ),
                if (!shouldAnimate || _currentIndex >= aboutMeText.length) ...[
                  SizedBox(height: 20),
                  _buildSkillChips(),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChips() {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills & Technologies',
            style: TextStyle(
              fontSize: widget.isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFDDA512),
            ),
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _buildChip('Flutter', Icons.flutter_dash),
              _buildChip('Mobile Dev', Icons.phone_iphone),
              _buildChip('Web Dev', Icons.web),
              _buildChip('UI/UX', Icons.design_services),
              _buildChip('Database', Icons.storage),
              _buildChip('API', Icons.api),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, IconData icon) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [Color(0xFF2C2C2C), Color(0xFF1C1C1C)]
                : [Color(0xFFFFFFFF), Color(0xFFF5F5F5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFDDA512).withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Color(0xFFDDA512).withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: widget.isMobile ? 18 : 20,
              color: Color(0xFFDDA512),
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color:
                    isDarkMode ? Colors.white.withOpacity(0.9) : Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: widget.isMobile ? 14 : 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
