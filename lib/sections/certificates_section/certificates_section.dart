import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/widgets/section_title.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CertificatesSection extends StatelessWidget {
  final bool isMobile;

  const CertificatesSection({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.width * 0.03),
          SectionTitle(title: 'Certificates', isMobile: isMobile),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 14 : 36.0),
            child: Text(
              'Continuous learning and improvement are the keys to success.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(
              height:
                  size.height > 1100 ? size.height * 0.04 : size.height * 0.06),

          // StreamBuilder to fetch images from Firestore
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('certificates')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              // Extract image URLs from the snapshot
              List<String> imageList = snapshot.data!.docs
                  .map((doc) => doc['image_url'] as String)
                  .toList();

              if (imageList.isEmpty) {
                return const Center(child: Text('No certificates found.'));
              }

              return CarouselSlider(
                options: CarouselOptions(
                  height: isMobile
                      ? size.height * 0.3
                      : (size.height > 1100
                          ? size.height * 0.35
                          : size.height * 0.6), // Height of the carousel
                  autoPlay: true, // Enables auto-scrolling
                  autoPlayInterval:
                      Duration(seconds: 3), // Time interval between slides
                  enlargeCenterPage: true, // Enlarges the center image
                  viewportFraction: isMobile
                      ? 0.8
                      : 0.6, // Controls the fraction of the screen each image takes
                  aspectRatio:
                      isMobile ? 9 / 9 : 12 / 9, // Aspect ratio of the carousel
                  enableInfiniteScroll: true, // Scroll infinitely in a loop
                ),
                items: imageList.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.network(
                          imagePath,
                          fit: BoxFit
                              .contain, // Ensure the image covers the container
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            },
          ),
          SizedBox(height: size.width * 0.07),
        ],
      ),
    );
  }
}
