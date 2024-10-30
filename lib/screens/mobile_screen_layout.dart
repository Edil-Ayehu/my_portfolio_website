import 'package:flutter_portfolio_website/export.dart';
import 'package:flutter_portfolio_website/sections/menu%20section/animated_menu_item.dart';

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
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: AppBar(
        backgroundColor: isDarkMode ? Color(0xFF131414) : Color(0xFFE6E6E6),
        elevation: 2,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: themeController.toggleThemeMode,
          ),
        ],
      ),
    ),
      drawer: myDrawer(isDarkMode, size, context),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              key: _homeKey,
              // height: MediaQuery.of(context).size.height,
              child: Header(isMobile: true, contactKey: _contactMeKey),
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
              child: PortfolioSection(),
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
    );
  }

  Drawer myDrawer(bool isDarkMode, Size size, BuildContext context) {
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
            AnimatedMenuItem(
              title: 'Home',
              icon: Icons.house_outlined,
              isActive: _activeSection == 'Home',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_homeKey);
              },
            ),
            AnimatedMenuItem(
              title: 'About',
              icon: Icons.person,
              isActive: _activeSection == 'About',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_aboutKey);
              },
            ),
            AnimatedMenuItem(
              title: 'Services',
              icon: Icons.build,
              isActive: _activeSection == 'Services',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_servicesKey);
              },
            ),
            AnimatedMenuItem(
              title: 'Portfolio',
              icon: Icons.folder,
              isActive: _activeSection == 'Portfolio',
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_portfolioKey);
              },
            ),
            AnimatedMenuItem(
              title: 'Contact Me',
              icon: Icons.contact_mail,
              isActive: _activeSection == 'Contact Me',
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
