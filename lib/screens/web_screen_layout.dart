import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/about%20section/about_section.dart';
import 'package:flutter_portfolio_website/sections/certificates_section/certificates_section.dart';
import 'package:flutter_portfolio_website/sections/contact%20me%20section/contact_me_section.dart';
import 'package:flutter_portfolio_website/sections/footer/footer.dart';
import 'package:flutter_portfolio_website/sections/header/header.dart';
import 'package:flutter_portfolio_website/sections/menu%20section/web_menu.dart';
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
                SizedBox(height: 60),
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
            left: 0,
            right: 0,
            child: Container(
              color: isDarkMode ? Color(0xFF131414) : Color(0xFFE6E6E6),
              child: WebMenu(
                activeSection: _activeSection,
                onSectionTap: _scrollToSection,
                sectionKeys: {
                  'Home': _homeKey,
                  'About': _aboutKey,
                  'Services': _servicesKey,
                  'Skills': _skillsKey,
                  'Portfolio': _portfolioKey,
                  'Certificates': _certificatesKey,
                  'Contact': _contactMeKey,
                },
                onThemeToggle: themeController.toggleThemeMode,
                isDarkMode: isDarkMode,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
