import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/header/widgets/social_icons.dart';

class NameAndTitle extends StatelessWidget {
  final bool isMobile;
  final GlobalKey contactKey;
  const NameAndTitle({
    super.key,
    this.isMobile = false,
    required this.contactKey,
  });

  // URL of the CV file in the web assets
  final String cvUrl = 'web/assets/cv/my_cv.pdf';

  void _downloadCV() {
    final anchor = html.AnchorElement(href: cvUrl)
      ..setAttribute('download', 'my_cv.pdf')
      ..click();
  }

  void _scrollToContact() {
    Scrollable.ensureVisible(contactKey.currentContext!,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: isMobile ? 0 : 75.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          SizedBox(height: isMobile ? 30 : 80),
          isMobile
              ? Column(
                  children: [
                    Text(
                      'Hello, I\'m',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w900,
                            color: isDarkMode
                                ? Color(0xFFE6E6E6)
                                : Color(0xFF131414),
                          ),
                    ),
                    Text(
                      'Edilayehu',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFDDA512),
                          ),
                    ),
                  ],
                )
              : RichText(
                  text: TextSpan(
                    text: 'Hello,\n',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w900,
                          color: isDarkMode
                              ? Color(0xFfE6E6E6)
                              : Color(0xFF131414),
                        ),
                    children: [
                      TextSpan(
                        text: 'I\'m ',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w900,
                              color: isDarkMode
                                  ? Color(0xFfE6E6E6)
                                  : Color(0xFF131414),
                            ),
                      ),
                      TextSpan(
                        text: 'Edilayehu',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Color(0xFFDDA512),
                            ),
                      )
                    ],
                  ),
                ),
          SizedBox(height: 10),
          Text(
            "Flutter & React Developer",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.4,
                ),
          ),
          SizedBox(height: 8),
          Text(
            "Crafting seamless digital experiences with a focus on innovation and user-centered solutions. Let's bring your vision to life with creativity and precision.",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
          ),
          SizedBox(height: 25),
          isMobile
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          // height: ,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFDDA512),
                              foregroundColor: Color(0xFFF0F8FF),
                              elevation: 5,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              fixedSize:
                                  Size(size.width * 0.09, size.height * 0.06),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: _scrollToContact,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Let\'s Talk',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isDarkMode ? Color(0xFfE6E6E6) : Colors.white,
                            foregroundColor: Color.fromARGB(255, 186, 115, 9),
                            elevation: 5,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            fixedSize:
                                Size(size.width * 0.14, size.height * 0.06),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: _downloadCV,
                          icon: Icon(
                            Icons.downloading_outlined,
                            color: Color(0xFF102C57),
                          ),
                          label: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Download CV',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: Color(0xFF102C57),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFDDA512),
                        foregroundColor: Color(0xFFF0F8FF),
                        elevation: 5,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        fixedSize: Size(size.width * 0.09, size.width * 0.036),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _scrollToContact,
                      child: Text(
                        'Let\'s Talk',
                        style: TextStyle(
                          fontSize: size.width * 0.011,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDarkMode ? Color(0xFfE6E6E6) : Colors.white,
                        foregroundColor: Color.fromARGB(255, 186, 115, 9),
                        elevation: 5,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        fixedSize: Size(size.width * 0.135, size.width * 0.036),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: _downloadCV,
                      icon: Icon(
                        Icons.downloading_outlined,
                        color: Color(0xFF102C57),
                      ),
                      label: Text(
                        'Download CV',
                        style: TextStyle(
                          fontSize: size.width * 0.011,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF102C57),
                        ),
                      ),
                    ),
                  ],
                ),
          SizedBox(height: isMobile ? 40 : 50),
          SocialIcons(isMobile: isMobile),
        ],
      ),
    );
  }
}
