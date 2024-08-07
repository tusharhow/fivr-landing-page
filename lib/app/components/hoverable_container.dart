import 'package:flutter/material.dart';

class HoverableContainer extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? hoverColor;
  final double? width;

  const HoverableContainer({
    super.key,
    required this.child,
    this.padding,
    this.width,
    required this.hoverColor,
  });

  @override
  _HoverableContainerState createState() => _HoverableContainerState();
}

class _HoverableContainerState extends State<HoverableContainer> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    Matrix4 hoverTransform = Matrix4.identity()..scale(1.05);
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        padding: widget.padding,
        transform: _isHovered ? hoverTransform : Matrix4.identity(),
        decoration: BoxDecoration(
          color: _isHovered ? widget.hoverColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isHovered
              ? [
                  const BoxShadow(
                      color: Colors.black26, blurRadius: 10, spreadRadius: 2)
                ]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
