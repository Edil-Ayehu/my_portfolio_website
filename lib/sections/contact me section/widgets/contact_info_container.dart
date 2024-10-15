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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 10,
      color: isDarkMode ? const Color(0xFF131414) : const Color(0xFFE6E6E6),
      child: Container(
        padding:
            const EdgeInsets.only(left: 35, right: 20, top: 25, bottom: 10),
        height: isMobile
            ? null
            : (size.height > 1100 ? size.width * 0.4 : size.width * 0.36),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF131414) : const Color(0xFFE6E6E6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE6E6E6),
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Contact Information',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 24,
                    ),
              ),
            ),
            SizedBox(height: isMobile ? 15 : 30),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _launchURL('tel:+251930884402'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.phone,
                      color: isDarkMode ? Colors.white : Colors.black,
                      size: isMobile ? size.width * 0.07 : size.width * 0.026,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          '+251930884402',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: isMobile ? 10 : 15),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _launchURL('mailto:tadesseedilayehu@gmail.com'),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: isDarkMode ? Colors.white : Colors.black,
                      size: isMobile ? size.width * 0.07 : size.width * 0.026,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 16),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'tadesseedilayehu@gmail.com',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: isMobile ? 10 : 15),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => _launchURL(
                    'https://www.google.com/maps?q=Addis+Ababa,+Ethiopia'),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: isDarkMode ? Colors.white : Colors.black,
                      size: isMobile ? size.width * 0.07 : size.width * 0.026,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          'Addis Ababa, Ethiopia',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            isMobile ? const SizedBox(height: 20) : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
