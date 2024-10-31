import 'package:flutter_portfolio_website/export.dart';
import 'package:flutter_portfolio_website/sections/about%20section/widgets/about_section_picture.dart';
import 'package:flutter_portfolio_website/sections/about%20section/widgets/about_text.dart';

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
      duration: const Duration(milliseconds: 1500),
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
        child: Stack(
          children: [
            // Background design elements
            Positioned(
              right: -50,
              top: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFDDA512).withOpacity(0.1),
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            ),
            // Main content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: widget.isMobile ? 20 : size.width * 0.1,
                vertical: size.height * 0.08,
              ),
              child: SlideTransition(
                position: _slideAnimation,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      Text(
                        'ABOUT ME',
                        style: TextStyle(
                          fontSize: widget.isMobile ? 14 : 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3,
                          color: Color(0xFFDDA512),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Know Me More',
                        style: TextStyle(
                          fontSize: widget.isMobile ? 28 : 36,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: size.height * 0.06),
                      widget.isMobile
                          ? Column(
                              children: [
                                AboutSectionPicture(isMobile: true),
                                SizedBox(height: 40),
                                AboutText(isMobile: true),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 2, child: AboutSectionPicture()),
                                SizedBox(width: 60),
                                Expanded(flex: 3, child: AboutText()),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
