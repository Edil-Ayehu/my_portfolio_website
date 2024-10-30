import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/export.dart';

class AnimatedMenuItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;

  const AnimatedMenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.isActive = false,
  }) : super(key: key);

  @override
  State<AnimatedMenuItem> createState() => _AnimatedMenuItemState();
}

class _AnimatedMenuItemState extends State<AnimatedMenuItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
@override
Widget build(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return MouseRegion(
    onEnter: (_) {
      if (mounted) {
        setState(() => isHovered = true);
        _controller.forward();
      }
    },
    onExit: (_) {
      if (mounted) {
        setState(() => isHovered = false);
        _controller.reverse();
      }
    },
    child: AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.scale(
        scale: _scaleAnimation.value,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: isHovered || widget.isActive
                    ? LinearGradient(
                        colors: isDarkMode
                            ? [Color(0xFFDDA512), Color(0xFFAB8210)]
                            : [Color(0xFF131414), Color(0xFF1C1B1F)],
                      )
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.icon,
                    size: 20,
                    color: (isHovered || widget.isActive)
                        ? Color(0xFFE6E6E6)
                        : isDarkMode
                            ? Color(0xFFE6E6E6)
                            : Color(0xFF131414),
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: (isHovered || widget.isActive)
                          ? Color(0xFFE6E6E6)
                          : isDarkMode
                              ? Color(0xFFE6E6E6)
                              : Color(0xFF131414),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}
