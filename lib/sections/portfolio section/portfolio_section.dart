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
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final isMediumScreen = size.width < 900;

    // Calculate card width based on screen size
    double cardWidth;
    if (isSmallScreen) {
      cardWidth = size.width * 0.8; // 80% of screen width for mobile
    } else if (isMediumScreen) {
      cardWidth = size.width * 0.4; // 40% for tablet
    } else {
      cardWidth = size.width * 0.28; // 28% for desktop
    }

    // Calculate container height based on screen size
    double containerHeight;
    if (isSmallScreen) {
      containerHeight = size.height * 0.4;
    } else if (size.height > 1100) {
      containerHeight = size.height * 0.3;
    } else {
      containerHeight = size.height * 0.5;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.width * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 14 : 36.0
            ),
            child: Text(
              'My Work',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SectionTitle(
            title: 'Recent Projects',
            isMobile: isSmallScreen,
          ),
          SizedBox(height: size.width * 0.045),
          SizedBox(
            height: containerHeight,
            child: ListView.builder(
              cacheExtent: 500,
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              itemCount: portfolios.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 14 : 36.0
              ),
              itemBuilder: (context, index) {
                final portfolio = portfolios[index];
                return Padding(
                  padding: EdgeInsets.only(
                    right: isSmallScreen ? 14 : 30.0
                  ),
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