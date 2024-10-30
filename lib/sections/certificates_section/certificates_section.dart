import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/widgets/project_shimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';

class CertificatesSection extends StatelessWidget {
  final bool isMobile;

  const CertificatesSection({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
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
            'CERTIFICATIONS',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
              color: Color(0xFFDDA512),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Professional Growth',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
            child: Text(
              'Continuous learning and improvement are the keys to success.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('certificates')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const ProjectShimmer();
              }

              List<String> imageList = snapshot.data!.docs
                  .map((doc) => doc['image_url'] as String)
                  .toList();

              if (imageList.isEmpty) {
                return Center(
                  child: Text(
                    'No certificates found.',
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                );
              }

              return CarouselSlider(
                options: CarouselOptions(
                  height: isMobile ? size.height * 0.3 : size.height * 0.5,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: true,
                  viewportFraction: isMobile ? 0.8 : 0.6,
                  enlargeFactor: 0.3,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                ),
                items: imageList.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFFDDA512).withOpacity(0.2),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            imagePath,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
          SizedBox(height: size.height * 0.05),
        ],
      ),
    );
  }
}
