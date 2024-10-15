import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/contact%20me%20section/widgets/contact_info_container.dart';
import 'package:flutter_portfolio_website/sections/contact%20me%20section/widgets/send_message_container.dart';
import 'package:flutter_portfolio_website/widgets/section_title.dart';

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
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.width * 0.03),
          SectionTitle(title: 'Get In Touch', isMobile: isMobile),
          SizedBox(height: isMobile ? size.width * 0.08 : size.width * 0.035),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 14 : 36.0),
            child: isMobile
                ? Column(
                    children: [
                      ContactInfoContainer(isMobile: isMobile),
                      SizedBox(height: size.height * 0.02),
                      SendMessageContainer(isMobile: isMobile), 
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(child: ContactInfoContainer()),
                      SizedBox(width: size.width * 0.05),
                      Flexible(child: SendMessageContainer()),
                      SizedBox(width: size.width * 0.05),
                    ],
                  ),
          ),
          SizedBox(height: size.width * 0.04),
        ],
      ),
    );
  }
}
