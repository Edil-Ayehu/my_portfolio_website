import 'package:flutter_portfolio_website/export.dart';

class LazyLoadGridView extends StatelessWidget {
  final List<dynamic> imageUrls;
  final Function(String) onImageTap;
  final int crossAxisCount;

  const LazyLoadGridView({
    super.key,
    required this.imageUrls,
    required this.onImageTap,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        return VisibilityDetector(
          key: Key('grid-item-$index'),
          onVisibilityChanged: (visibilityInfo) {
            // Load image when it becomes visible
          },
          child: GestureDetector(
            onTap: () => onImageTap(imageUrls[index]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return CachedNetworkImage(
                    imageUrl: imageUrls[index],
                    imageBuilder: (context, imageProvider) {
                      return Image(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      );
                    },
                    placeholder: (context, url) => Container(
                      height: constraints.maxWidth * 0.8, // temporary height while loading
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFDDA512)),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: constraints.maxWidth * 0.8,
                      color: Colors.grey[200],
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error_outline, color: Colors.red, size: 32),
                            SizedBox(height: 8),
                            Text("Failed to load image"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}