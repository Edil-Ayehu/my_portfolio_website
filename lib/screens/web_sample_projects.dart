import 'package:flutter_portfolio_website/export.dart';
import 'package:flutter_portfolio_website/widgets/lazy_load_grid_view.dart';

class WebSampleProjects extends StatefulWidget {
  const WebSampleProjects({super.key});

  @override
  _WebSampleProjectsState createState() => _WebSampleProjectsState();
}

class _WebSampleProjectsState extends State<WebSampleProjects> {
  int _selectedProjectIndex = 0; // Store the selected project index
  int _currentImageIndex =
      0; // Track the current image index for the large view

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Web Sample Projects',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Fetch the frontend_projects from the specific document in projects
        stream: FirebaseFirestore.instance
            .collection('projects')
            .doc('YnbcR3QTzVOQXCuyrMhr') // Replace with your actual document ID
            .collection('frontend_projects')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Check if there are no projects
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No projects found in Web Sample Projects.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
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
                  // Description of the selected project below the images
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
                    projectDocs[_selectedProjectIndex]['description'],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
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

  // Method to show the large image with navigation
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
                // Next Button (visible and outside the image region)
                if (_currentImageIndex < imageUrls.length - 1)
                  Positioned(
                    right: 20, // Positioned to be visible outside the image
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0.5), // Background visibility
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _currentImageIndex++; // Go to the next image
                          });
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
