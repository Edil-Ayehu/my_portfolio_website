import 'package:flutter_portfolio_website/export.dart';

class PortfolioSection extends StatelessWidget {
  PortfolioSection({super.key});

  final List<Map<String, dynamic>> portfolios = [
    {
      'title': 'Mobile Apps',
      'description':
          'Building sleek, cross-platform mobile apps with Flutter, delivering fast, responsive user experiences for both Android and iOS.',
      'detailPage': const MobileSampleProjects(),
    },
    {
      'title': 'Websites',
      'description':
          'Creating dynamic, responsive websites with modern front-end technologies for seamless user experiences across all devices.',
      'detailPage': const WebSampleProjects(),
    },
    {
      'title': 'UI/UX Designs',
      'description':
          'Designing intuitive, user-centered experiences that prioritize functionality and aesthetics to enhance digital interactions.',
      'detailPage': const UxSampleProjects(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isSmallScreen = size.width < 600;
    final isMediumScreen = size.width < 900;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    double cardWidth = isSmallScreen
        ? size.width * 0.85
        : (isMediumScreen ? size.width * 0.45 : size.width * 0.3);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDarkMode
              ? [Color(0xFF1A1A1A), Color(0xFF262626)]
              : [Color(0xFFF5F5F5), Color(0xFFE8E8E8)],
        ),
      ),
      child: Column(
        children: [
          Text(
            'MY PORTFOLIO',
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Color(0xFFDDA512),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Recent Projects',
            style: TextStyle(
              fontSize: isSmallScreen ? 28 : 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          SizedBox(
            height: isSmallScreen ? size.height * 0.4 : size.height * 0.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding:
                  EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 40),
              itemCount: portfolios.length,
              itemBuilder: (context, index) {
                final portfolio = portfolios[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ProductCard(
                    title: portfolio['title']!,
                    description: portfolio['description']!,
                    cardWidth: cardWidth,
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => portfolio['detailPage'],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
