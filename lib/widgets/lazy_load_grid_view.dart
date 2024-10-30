import 'package:flutter_portfolio_website/export.dart';
import 'package:shimmer/shimmer.dart';

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
            if (visibilityInfo.visibleFraction > 0.1) {
              precacheImage(NetworkImage(imageUrls[index]), context);
            }
          },
          child: GestureDetector(
            onTap: () => onImageTap(imageUrls[index]),
            child: Hero(
              tag: 'image-${imageUrls[index]}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CachedNetworkImage(
                      imageUrl: imageUrls[index],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxWidth * 0.8,
                            minWidth: constraints.maxWidth,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: Text(
                            'Failed to load image',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
