import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/services%20section/widgets/service_card.dart';
import 'package:flutter_portfolio_website/widgets/different_color_section_title.dart';

class ServicesSection extends StatelessWidget {
  final bool isMobile;
  const ServicesSection({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.width * 0.03),
          DifferentColorSectionTitle(
            firstText: 'My',
            secondText: 'Services',
            isUnderlined: true,
          ),
          SizedBox(height: size.width * 0.075),
          // services
          isMobile
              ? SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ServiceCard(
                        label: '  Mobile App\nDevelopment',
                        isMobile: true,
                      ),
                      ServiceCard(
                        label: 'Web Frontend\nDevelopment',
                        isMobile: true,
                      ),
                      ServiceCard(
                        label: 'UI/UX Design',
                        isMobile: true,
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ServiceCard(
                      label: '  Mobile App\nDevelopment',
                    ),
                    SizedBox(width: 16),
                    ServiceCard(
                      label: 'Web Fronted\nDevelopment',
                    ),
                    SizedBox(width: 16),
                    ServiceCard(
                      label: 'UI/UX Design',
                    ),
                  ],
                ),
          SizedBox(height: size.width * 0.04),
        ],
      ),
    );
  }
}
