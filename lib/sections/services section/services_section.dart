import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/services%20section/widgets/service_card.dart';

class ServicesSection extends StatelessWidget {
  final bool isMobile;
  const ServicesSection({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.08,
        horizontal: isMobile ? 20 : 40,
      ),
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
            'WHAT I DO',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Color(0xFFDDA512),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'My Services',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: size.height * 0.06),
          if (isMobile)
            Column(
              children: _buildServiceCards(isMobile),
            )
          else
            Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: _buildServiceCards(isMobile),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildServiceCards(bool isMobile) {
    final services = [
      ServiceData(
        'Mobile App Development',
        'Flutter • React Native\nNative Android/iOS',
        Icons.phone_iphone,
      ),
      ServiceData(
        'Web Development',
        'React • Next.js\nTailwind CSS • Flutter Web',
        Icons.web,
      ),
      ServiceData(
        'UI/UX Design',
        'Figma • Adobe XD\nPrototyping • Wireframing',
        Icons.design_services,
      ),
    ];

    return services.map((service) {
      return ServiceCard(
        title: service.title,
        description: service.description,
        icon: service.icon,
        isMobile: isMobile,
      );
    }).toList();
  }
}

class ServiceData {
  final String title;
  final String description;
  final IconData icon;

  ServiceData(this.title, this.description, this.icon);
}
