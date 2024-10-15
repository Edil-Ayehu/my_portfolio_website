import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/about%20section/about_section.dart';
import 'package:flutter_portfolio_website/sections/certificates_section/certificates_section.dart';
import 'package:flutter_portfolio_website/sections/contact%20me%20section/contact_me_section.dart';
import 'package:flutter_portfolio_website/sections/footer/footer.dart';
import 'package:flutter_portfolio_website/sections/header/header.dart';
import 'package:flutter_portfolio_website/sections/portfolio%20section/portfolio_section.dart';
import 'package:flutter_portfolio_website/sections/services%20section/services_section.dart';
import 'package:flutter_portfolio_website/sections/skills_section.dart/skills_section.dart';
import 'package:flutter_portfolio_website/theme/theme_controller.dart';
import 'package:provider/provider.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({super.key});

  @override
  _WebScreenLayoutState createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactMeKey = GlobalKey();
  final GlobalKey _certificatesKey = GlobalKey();
  String _activeSection = 'Home';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateActiveSection);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateActiveSection);
    super.dispose();
  }

  void _updateActiveSection() {
    final scrollPosition = _scrollController.offset;
    final screenHeight = MediaQuery.of(context).size.height;

    setState(() {
      if (scrollPosition < screenHeight) {
        _activeSection = 'Home';
      } else if (scrollPosition < screenHeight * 2) {
        _activeSection = 'About';
      } else if (scrollPosition < screenHeight * 3) {
        _activeSection = 'Services';
      } else if (scrollPosition < screenHeight * 5) {
        _activeSection = 'Portfolio';
      } else {
        _activeSection = 'Contact me';
      }
    });
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    TextStyle _menuTextStyle(String section) {
      return Theme.of(context).textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 0.012,
            color: (isDarkMode
                    ? Color(0xFfE6E6E6)
                    : Colors.black87), // Inactive color
          );
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController, 
            child: Column(
              children: [
                SizedBox(
                  key: _homeKey,
                  child: Header(contactKey: _contactMeKey),
                ),
                SizedBox(
                  key: _aboutKey,
                  child: AboutSection(),
                ),
                SizedBox(
                  key: _servicesKey,
                  child: ServicesSection(),
                ),
                SizedBox(
                  key: _skillsKey,
                  child: SkillsSection(),
                ),
                SizedBox(
                  key: _portfolioKey,
                  child: PortfolioSection(),
                ),
                SizedBox(
                  key: _certificatesKey,
                  child: CertificatesSection(),
                ),
                SizedBox(
                  key: _contactMeKey,
                  child: ContactMeSection(), 
                ),
                SizedBox(height: 30),
                Footer(),
              ],
            ),
          ),
          // menu bar
          Positioned(
            top: 0,
            right: 0,
            left: size.width * 0.5,
            child: SizedBox(
              // width: double.infinity,
              height: 60,
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                color: isDarkMode ? Color(0xFF131414) : Color(0xFFE6E6E6),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Menu item with MouseRegion for hover effect
                      MouseRegion(
                        cursor: SystemMouseCursors
                            .click, // Change cursor to pointer
                        child: GestureDetector(
                          onTap: () {
                            _scrollToSection(_homeKey);
                          },
                          child: Text('HOME', style: _menuTextStyle('Home')),
                        ),
                      ),
                      SizedBox(width: size.width * 0.025),
                      MouseRegion(
                        cursor: SystemMouseCursors
                            .click, // Change cursor to pointer
                        child: GestureDetector(
                          onTap: () {
                            _scrollToSection(_aboutKey);
                          },
                          child: Text('ABOUT', style: _menuTextStyle('About')),
                        ),
                      ),
                      SizedBox(width: size.width * 0.025),
                      MouseRegion(
                        cursor: SystemMouseCursors
                            .click, // Change cursor to pointer
                        child: GestureDetector(
                          onTap: () {
                            _scrollToSection(_servicesKey);
                          },
                          child: Text('SERVICES',
                              style: _menuTextStyle('Services')),
                        ),
                      ),
                      SizedBox(width: size.width * 0.025),
                      MouseRegion(
                        cursor: SystemMouseCursors
                            .click, // Change cursor to pointer
                        child: GestureDetector(
                          onTap: () {
                            _scrollToSection(_portfolioKey);
                          },
                          child: Text('PORTFOLIO',
                              style: _menuTextStyle('Portfolio')),
                        ),
                      ),
                      SizedBox(width: size.width * 0.025),
                      MouseRegion(
                        cursor: SystemMouseCursors
                            .click, // Change cursor to pointer
                        child: GestureDetector(
                          onTap: () {
                            _scrollToSection(_contactMeKey);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? Color(0xFfE6E6E6)
                                  : Color(0xFFDDA512),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'CONTACT ME',
                              style: _menuTextStyle('Contact me').copyWith(
                                color: isDarkMode
                                    ? Color(0xFF131414)
                                    : Color(0xFfE6E6E6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.025),
                      IconButton(
                        icon: Icon(
                          themeController.themeMode == ThemeMode.light
                              ? Icons.dark_mode
                              : Icons.light_mode,
                        ),
                        onPressed: themeController.toggleThemeMode,
                      ),
                      SizedBox(width: size.width * 0.015),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
