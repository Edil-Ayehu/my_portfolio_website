import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/contact%20me%20section/widgets/contact_info_container.dart';
import 'package:flutter_portfolio_website/sections/contact%20me%20section/widgets/send_message_container.dart';

class ContactMeSection extends StatelessWidget {
  final bool isMobile;
  const ContactMeSection({
    super.key,
    this.isMobile = false,
  }); 

@override
Widget build(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  final size = MediaQuery.of(context).size;
  
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: size.height * 0.08),
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
          'GET IN TOUCH',
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
            color: Color(0xFFDDA512),
          ),
        ),
        SizedBox(height: 12),
        Text(
          'Contact Me',
          style: TextStyle(
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        SizedBox(height: size.height * 0.05),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
          child: isMobile
              ? Column(children: [
                  ContactInfoContainer(isMobile: isMobile),
                  SizedBox(height: 24),
                  SendMessageContainer(isMobile: isMobile),
                ])
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: ContactInfoContainer()),
                    SizedBox(width: 40),
                    Expanded(child: SendMessageContainer()),
                  ],
                ),
        ),
      ],
    ),
  );
}
}
