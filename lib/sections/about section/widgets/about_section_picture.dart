import 'package:flutter_portfolio_website/export.dart';

class AboutSectionPicture extends StatefulWidget {
  final bool isMobile;
  const AboutSectionPicture({super.key, this.isMobile = false});

  @override
  State<AboutSectionPicture> createState() => _AboutSectionPictureState();
}

class _AboutSectionPictureState extends State<AboutSectionPicture> 
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return MouseRegion(
      onEnter: (_) {
        if (!widget.isMobile) {
          setState(() => isHovered = true);
          _controller.forward();
        }
      },
      onExit: (_) {
        if (!widget.isMobile) {
          setState(() => isHovered = false);
          _controller.reverse();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: widget.isMobile ? size.width * 0.9 : size.width * 0.32,
            height: widget.isMobile ? size.width * 0.9 : size.width * 0.32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: isHovered ? 20 : 10,
                  offset: Offset(0, isHovered ? 10 : 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/edil.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}