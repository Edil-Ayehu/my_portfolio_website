import 'package:flutter_portfolio_website/export.dart';
import 'package:flutter_portfolio_website/sections/about%20section/widgets/about_section_picture.dart';
import 'package:flutter_portfolio_website/sections/about%20section/widgets/about_text.dart';
import 'package:flutter_portfolio_website/widgets/different_color_section_title.dart';

class AboutSection extends StatefulWidget {
  final bool isMobile;
  const AboutSection({super.key, this.isMobile = false});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) {
          _controller.forward();
        }
      },
      child: Container(
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
        padding: EdgeInsets.symmetric(horizontal: widget.isMobile ? 20 : 36),
        child: SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height:
                        widget.isMobile ? size.width * 0.1 : size.width * 0.03),
                widget.isMobile
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
                          Flexible(child: AboutText()),
                        ],
                      ),
                SizedBox(height: size.width * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
