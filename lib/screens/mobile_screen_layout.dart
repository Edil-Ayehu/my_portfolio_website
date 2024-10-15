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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  _MobileScreenLayoutState createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
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
      } else if (scrollPosition < screenHeight * 4) {
        _activeSection = 'Skills';
      } else if (scrollPosition < screenHeight * 5) {
        _activeSection = 'Portfolio';
      } else if (scrollPosition < screenHeight * 6) {
        _activeSection = 'Certificates';
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Color(0xFF131414) : Color(0xFFE6E6E6),
        title: Text('Edilayehu'),
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkMode ? Color(0xFfE6E6E6) : Colors.black87,
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeController.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: themeController.toggleThemeMode,
          ),
        ],
      ),
      drawer: myDrawer(isDarkMode, size, context),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                SizedBox(
                  key: _homeKey,
                  // height: MediaQuery.of(context).size.height,
                  child: Header(isMobile: true,contactKey: _contactMeKey),
                ),
                SizedBox(
                  key: _aboutKey,
                  child: AboutSection(isMobile: true),
                ),
                SizedBox(
                  key: _servicesKey,
                  child: ServicesSection(isMobile: true),
                ),
                SizedBox(
                  key: _skillsKey,
                  child: SkillsSection(isMobile: true),
                ),
                SizedBox(
                  key: _portfolioKey,
                  child: PortfolioSection(isMobile: true),
                ),
                SizedBox(
                  key: _certificatesKey,
                  child: CertificatesSection(isMobile: true),
                ),
                SizedBox(
                  key: _contactMeKey,
                  child: ContactMeSection(isMobile: true),
                ),
                SizedBox(height: 30),
                Footer(isMobile: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Drawer myDrawer(bool isDarkMode, Size size,
      BuildContext context) {
    return Drawer(
      child: Container(
        color: isDarkMode ? Color(0xFF131414) : Color(0xFFE6E6E6),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: isDarkMode ? Color(0xFF131414) : Color(0xFFE6E6E6),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 28.0,
                  left: 20,
                ),
                child: Text(
                  'Menu',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.house_outlined),
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_homeKey);
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.user),
              title: Text(
                'About',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_aboutKey);
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.toolbox),
              title: Text(
                'Services',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_servicesKey);
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.laptopCode),
              title: Text(
                'Skill Set',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_skillsKey);
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.folder),
              title: Text(
                'Portfolio',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_portfolioKey);
              },
            ),
            ListTile(
              leading: Icon(Icons.verified),
              title: Text(
                'Certificates',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_certificatesKey);
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text(
                'Contact Me',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: Icon(Icons.navigate_next_outlined),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_contactMeKey);
              },
            ),
          ],
        ),
      ),
    );
  }
}
