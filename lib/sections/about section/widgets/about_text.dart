import 'dart:async';

import 'package:flutter_portfolio_website/export.dart';
import 'package:flutter_portfolio_website/widgets/different_color_section_title.dart';

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

I'm constantly learning and staying updated with the latest technologies to deliver modern, efficient solutions. My goal is to create impactful digital experiences that make a difference.''';

  bool get _isMounted => mounted;
  String _displayText = '';
  Timer? _timer;
  int _currentIndex = 0;

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
    _startTypingAnimation();
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
          DifferentColorSectionTitle(
            firstText: 'About',
            secondText: 'me',
          ),
          SizedBox(height: 20),
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
                  _displayText,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        letterSpacing: 1.2,
                        height: 1.6,
                        fontWeight: FontWeight.w500,
                        fontSize: widget.isMobile ? 16 : 18,
                      ),
                ),
                if (_currentIndex >= aboutMeText.length) ...[
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
    return Wrap(
      spacing: 24,
      runSpacing: 14,
      children: [
        _buildChip('Flutter'),
        _buildChip('Dart'),
        _buildChip('Firebase'),
        _buildChip('UI/UX'),
        _buildChip('Git'),
        _buildChip('REST API'),
      ],
    );
  }

  Widget _buildChip(String label) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Chip(
      label: Text(label),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isDarkMode ? Colors.white24 : Colors.black12,
          width: 1,
        ),
      ),
      backgroundColor: isDarkMode ? Color(0xFF1C1B1F) : Color(0xFFF0F8FF),
      labelStyle: TextStyle(
        color: isDarkMode ? Colors.white70 : Colors.black87,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
