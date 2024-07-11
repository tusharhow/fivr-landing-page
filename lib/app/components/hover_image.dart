import 'package:flutter/material.dart';

class HoverZoomImage extends StatefulWidget {
  final String imageUrl;

  HoverZoomImage({required this.imageUrl});

  @override
  _HoverZoomImageState createState() => _HoverZoomImageState();
}

class _HoverZoomImageState extends State<HoverZoomImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isHovered
              ? [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 1)]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              AnimatedScale(
                scale: _isHovered ? 1.2 : 1.0,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: Image.network(
                  widget.imageUrl,
                  width: 300, // Adjust width as needed
                  height: 300, // Adjust height as needed
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: _isHovered ? 0.8 : 0.0,
                  child: Container(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
