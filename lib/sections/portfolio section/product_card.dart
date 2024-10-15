import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPress;
  final bool isMobile;
  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.onPress,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Card(
      color: isDarkMode ? Color(0xFF131414) : Color(0xFfE6E6E6),
      elevation: 10,
      child: Container(
        width: isMobile ? size.width * 0.6 : size.width * 0.28,
        padding: EdgeInsets.only(
          right: isMobile ? 8 : 14,
          left: isMobile ? 8 : 14,
          top: isMobile ? 8 : 14,
          bottom: isMobile ? 4 : 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Color(0xFfE6E6E6),
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
            ),
            SizedBox(height: isMobile ? 10 : 18),
            Flexible(
              flex: 2,
              child: AutoSizeText(
                description,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                minFontSize: 10,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: onPress,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'See more',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        color:
                            isDarkMode ? Color(0xFfE6E6E6) : Color(0xFFDDA512),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.navigate_next_outlined,
                          size: 19,
                          color: isDarkMode
                              ? Color(0xFf131414)
                              : Color(0xFfE6E6E6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
