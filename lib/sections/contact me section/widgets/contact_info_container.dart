import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfoContainer extends StatelessWidget {
  final bool isMobile;
  const ContactInfoContainer({
    super.key,
    this.isMobile = false,
  });

  // Function to launch URLs
  void _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $urlString';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C3E50), // Dark blue-grey
            Color(0xFF1A1A1A), // Almost black
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 25,
            offset: Offset(0, 15),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            blurRadius: 20,
            offset: Offset(-15, -15),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            left: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.03),
              ),
            ),
          ),
          // Main content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactTitle(),
              SizedBox(height: 40),
              ..._buildContactItems(),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContactItems() {
    final items = [
      {
        'icon': Icons.phone_in_talk_rounded,
        'title': 'Phone',
        'value': '+251930884402',
        'url': 'tel:+251930884402',
      },
      {
        'icon': Icons.mail_rounded,
        'title': 'Email',
        'value': 'tadesseedilayehu@gmail.com',
        'url': 'mailto:tadesseedilayehu@gmail.com',
      },
      {
        'icon': Icons.location_on_rounded,
        'title': 'Location',
        'value': 'Addis Ababa, Ethiopia',
        'url': 'https://maps.google.com?q=Addis+Ababa',
      },
    ];

    return items
        .map((item) => _buildContactItem(
              icon: item['icon'] as IconData,
              title: item['title'] as String,
              value: item['value'] as String,
              onTap: () => _launchURL(item['url'] as String),
            ))
        .toList();
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 28),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue[400]!,
                        Colors.blue[600]!,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 22),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[400]!, Colors.blue[600]!],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.headset_mic_rounded,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 8),
              Text(
                'Let\'s Connect',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.9)],
          ).createShader(bounds),
          child: Text(
            'Get in Touch',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: Colors.blue[400]!,
                width: 3,
              ),
            ),
          ),
          child: Text(
            'Feel free to reach out. I\'m always open to discussing new projects, creative ideas, or opportunities.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14,
              height: 1.6,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ],
    );
  }
}
