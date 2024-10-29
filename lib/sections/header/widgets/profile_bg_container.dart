import 'package:flutter/material.dart';

class ProfileBgContainer extends StatefulWidget {
  const ProfileBgContainer({
    super.key,
  });

  @override
  State<ProfileBgContainer> createState() => _ProfileBgContainerState();
}

class _ProfileBgContainerState extends State<ProfileBgContainer> with SingleTickerProviderStateMixin {

    late AnimationController _controller;
  late Animation<double> _rotationAnimation;

    @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 2 * 3.14159, // Full rotation
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _controller.repeat(); // Continuous rotation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Check the current theme
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return AnimatedBuilder(
            animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _rotationAnimation.value,
          child: child,
        );
      },
      child: Align(
        alignment: Alignment.center,
        child: Transform.rotate(
          angle: 40,
          child: Card(
            elevation: 9,
            child: Container(
              width: size.width * 0.26,
              height: size.width * 0.26,
              decoration: BoxDecoration(
                color: isDarkMode ? Color(0xFF1C1B1F) : Color(0xFFF0F8FF),
                borderRadius: BorderRadius.circular(21),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
