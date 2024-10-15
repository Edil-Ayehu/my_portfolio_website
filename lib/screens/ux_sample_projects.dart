import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UxSampleProjects extends StatefulWidget {
  const UxSampleProjects({super.key});

  @override
  _UxSampleProjectsState createState() => _UxSampleProjectsState();
}

class _UxSampleProjectsState extends State<UxSampleProjects> {
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
          'UI/UX Design',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Fetch the ui_ux_projects from the specific document in projects
        stream: FirebaseFirestore.instance
            .collection('projects')
            .doc('YnbcR3QTzVOQXCuyrMhr')
            .collection('ui_ux_projects')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // Check if there are no projects
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No projects found in UI/UX Design Projects.',
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
                  MasonryGridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        size.width > 900 ? 4 : (size.width > 600 ? 3 : 2),
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                    itemCount: (projectDocs[_selectedProjectIndex]['image_urls']
                            as List<dynamic>)
                        .length,
                    itemBuilder: (context, index) {
                      String imageUrl = (projectDocs[_selectedProjectIndex]
                          ['image_urls'] as List<dynamic>)[index];
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            _currentImageIndex = index; // Set the initial index
                            _showLargeImage(
                                context,
                                projectDocs[_selectedProjectIndex]['image_urls']
                                    as List<dynamic>);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                return const Center(
                                  child: Text("Failed to load image"),
                                );
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // Display Project Description
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

  // Method to show the large image with navigation
  void _showLargeImage(BuildContext context, List<dynamic> imageUrls) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.network(
                      imageUrls[_currentImageIndex],
                      fit: BoxFit.contain,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const Center(
                            child: Text("Failed to load image"));
                      },
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
        },);
      },
    );
  }
}
