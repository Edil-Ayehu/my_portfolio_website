import 'package:flutter_portfolio_website/export.dart';

class MobileSampleProjects extends StatefulWidget {
  const MobileSampleProjects({super.key});

  @override
  _MobileSampleProjectsState createState() => _MobileSampleProjectsState();
}

class _MobileSampleProjectsState extends State<MobileSampleProjects> {
  int _selectedProjectIndex = 0; // Store the selected project index
  int _currentImageIndex =
      0; // Track the current image index for the large view

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Mobile App Projects',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Fetch the mobile_app_projects from the specific document in the projects collection
        stream: FirebaseFirestore.instance
            .collection('projects')
            .doc('YnbcR3QTzVOQXCuyrMhr') // Replace with your actual document ID
            .collection('mobile_app_projects')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No Mobile App Projects Found',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            );
          }

          var projectDocs = snapshot.data!.docs;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 28),
                  // Horizontal ListView for Project Titles
                  SizedBox(
                    height: 50, // Set a fixed height for the ListView
                    child: ListView.builder(
                      cacheExtent: 500,
                      addAutomaticKeepAlives: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: projectDocs.length,
                      itemBuilder: (context, index) {
                        String projectTitle = projectDocs[index]['title'];
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedProjectIndex = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  width: _selectedProjectIndex == index ? 2 : 1,
                                  color: _selectedProjectIndex == index
                                      ? const Color.fromARGB(255, 198, 143, 4)
                                      : const Color.fromARGB(
                                          255, 179, 182, 182),
                                ),
                              ),
                              child: Text(
                                projectTitle,
                                style: const TextStyle(
                                  color: Color(0xFF131414),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Display corresponding images in MasonryGridView based on selected project
                  LazyLoadGridView(
                    imageUrls: projectDocs[_selectedProjectIndex]['image_urls']
                        as List<dynamic>,
                    crossAxisCount:
                        size.width > 900 ? 4 : (size.width > 600 ? 3 : 2),
                    onImageTap: (String imageUrl) {
                      _currentImageIndex = (projectDocs[_selectedProjectIndex]
                              ['image_urls'] as List<dynamic>)
                          .indexOf(imageUrl);
                      _showLargeImage(
                        context,
                        projectDocs[_selectedProjectIndex]['image_urls']
                            as List<dynamic>,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // Display project description
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    projectDocs[_selectedProjectIndex]['description'] ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showLargeImage(BuildContext context, List<dynamic> imageUrls) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Hero(
                  tag: 'image-${imageUrls[_currentImageIndex]}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: CachedNetworkImage(
                      imageUrl: imageUrls[_currentImageIndex],
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Container(
                        color: Colors.transparent,
                        child: const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color(0xFFDDA512)),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: Colors.transparent,
                        child: const Center(
                          child: Text("Failed to load image"),
                        ),
                      ),
                    ),
                  ),
                ),
                // Previous Button (visible and outside the image region)
                if (_currentImageIndex > 0)
                  Positioned(
                    left: 10, // Positioned to be visible outside the image
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            size: 20, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _currentImageIndex--; // Go to the previous image
                          });
                        },
                      ),
                    ),
                  ),
                // Next Button (visible and outside the image region)
                if (_currentImageIndex < imageUrls.length - 1)
                  Positioned(
                    right: 10, // Positioned to be visible outside the image
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.white),
                        onPressed: () {
                          setState(
                            () {
                              _currentImageIndex++; // Go to the next image
                            },
                          );
                        },
                      ),
                    ),
                  ),
                // Close Button
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
