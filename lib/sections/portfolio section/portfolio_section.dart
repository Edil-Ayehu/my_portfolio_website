import 'package:flutter_portfolio_website/export.dart';

class PortfolioSection extends StatelessWidget {
  final bool isMobile;
  PortfolioSection({
    super.key,
    this.isMobile = false,
  });

  final List<Map<String, dynamic>> portfolios = [
    {
      'title': 'Mobile Apps',
      'description':
          'Building sleek, cross-platform mobile apps with Flutter, delivering fast, responsive user experiences for both Android and iOS.',
      'detailPage': MobileSampleProjects(),
    },
    {
      'title': 'Websites',
      'description':
          'Creating dynamic, responsive websites with modern front-end technologies for seamless user experiences across all devices.',
      'detailPage': WebSampleProjects(),
    },
    {
      'title': 'UI/UX Designs',
      'description':
          'Designing intuitive, user-centered experiences that prioritize functionality and aesthetics to enhance digital interactions.',
      'detailPage': UxSampleProjects(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.width * 0.03),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 14 : 36.0),
            child:
                Text('My Work', style: Theme.of(context).textTheme.titleSmall),
          ),
          SectionTitle(title: 'Recent Projects', isMobile: isMobile),
          SizedBox(height: size.width * 0.045),
          isMobile
              ? SizedBox(
                  height: size.height * 0.34,
                  child: ListView.builder(
                    cacheExtent: 500,
                    addAutomaticKeepAlives: true,
                    shrinkWrap: true,
                    itemCount: portfolios.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final portfolio = portfolios[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 14.0, left: 14),
                        child: ProductCard(
                          title: portfolio['title']!,
                          description: portfolio['description']!,
                          onPress: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return portfolio['detailPage'];
                                },
                              ),
                            );
                          },
                          isMobile: true,
                        ),
                      );
                    },
                  ),
                )
              : Container(
                  height: size.height > 1100
                      ? size.height * 0.3
                      : size.height * 0.5,
                  padding: const EdgeInsets.only(left: 36.0, right: 10),
                  child: ListView.builder(
                    cacheExtent: 500,
                    addAutomaticKeepAlives: true,
                    shrinkWrap: true,
                    itemCount: portfolios.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final portfolio = portfolios[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: ProductCard(
                          title: portfolio['title']!,
                          description: portfolio['description']!,
                          onPress: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return portfolio['detailPage'];
                                },
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
