import 'package:flutter_portfolio_website/export.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPress;
  final double cardWidth;
  
  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.onPress,
    required this.cardWidth,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;
    final isMediumScreen = size.width < 900;

    return Card(
      color: isDarkMode ? const Color(0xFF131414) : const Color(0xFfE6E6E6),
      elevation: 10,
      child: Container(
        width: cardWidth,
        padding: EdgeInsets.symmetric(
          horizontal: isSmallScreen ? 8 : 14,
          vertical: isSmallScreen ? 8 : 14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: const Color(0xFfE6E6E6),
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: isSmallScreen ? 16 : (isMediumScreen ? 18 : 20),
                  ),
            ),
            SizedBox(height: isSmallScreen ? 10 : 18),
            Expanded(
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
            Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                onPressed: onPress,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'See more',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    const SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        color: isDarkMode ? const Color(0xFfE6E6E6) : const Color(0xFFDDA512),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.navigate_next_outlined,
                          size: isSmallScreen ? 16 : 19,
                          color: isDarkMode ? const Color(0xFf131414) : const Color(0xFfE6E6E6),
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