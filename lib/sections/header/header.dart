import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/sections/header/widgets/name_and_title.dart';
import 'package:flutter_portfolio_website/sections/header/widgets/profile_bg_container.dart';

class Header extends StatefulWidget {
  final bool isMobile;
  final GlobalKey contactKey;
  const Header({
    super.key,
    this.isMobile = false,
    required this.contactKey,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  // Initial opacity value
  double _opacity = 0.7;

  @override
  Widget build(BuildContext context) {
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(left: 30, right: 10, top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDarkMode ? Color(0xFF131414) : Color(0xFfE6E6E6),
        image: !widget.isMobile
            ? (isDarkMode
                ? DecorationImage(
                    image: AssetImage('assets/images/bg3.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.dstATop,
                    ),
                  )
                : null)
            : null,
      ),
      child: widget.isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile picture
                SizedBox(height: 50),
                profilePicture(),
                // name and title
                NameAndTitle(
                    isMobile: widget.isMobile, contactKey: widget.contactKey),
              ],
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height > 1100
                      ? size.height * 0.05
                      : size.height * 0.1,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // name and title
                    Expanded(
                      child: NameAndTitle(contactKey: widget.contactKey),
                    ),
                    // Profile picture
                    Expanded(child: profilePicture()),
                    // Social Icons
                  ],
                ),
                SizedBox(
                  height: size.height > 1100
                      ? size.height * 0.05
                      : size.height * 0.1,
                ),
              ],
            ),
    );
  }

  Stack profilePicture() {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        widget.isMobile ? SizedBox.shrink() : ProfileBgContainer(),
        MouseRegion(
          onEnter: (event) {
            setState(() {
              _opacity = 1.0; // Change opacity to 1.0 when hovered
            });
          },
          onExit: (event) {
            setState(() {
              _opacity = 0.7; // Change opacity back to 0.5 when not hovered
            });
          },
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300), // Smooth transition
            opacity: widget.isMobile ? 1 : _opacity,
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(widget.isMobile ? 1000 : 21),
                child: Image.asset(
                  'assets/images/edile.JPG',
                  fit: BoxFit.cover,
                  width: widget.isMobile ? size.width * 0.6 : size.width * 0.26,
                  height:
                      widget.isMobile ? size.width * 0.6 : size.width * 0.26,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
