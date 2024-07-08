// import 'package:flutter/material.dart';

// class HoverableAnimatedContainer extends StatefulWidget {
//   final Widget child;
//   final String imagePath;
//   final bool isImageAvailable;
//   final double initialBottom;
//   final double hoveredBottom;
//   final double containerHeight;
//   final String text;
//   final EdgeInsetsGeometry textPadding;
//   final Widget widget;

//   const HoverableAnimatedContainer({
//     super.key,
//     required this.child,
//     required this.imagePath,
//     required this.isImageAvailable,
//     required this.text,
//     this.initialBottom = -130,
//     this.hoveredBottom = 20,
//     required this.containerHeight,
//     required this.textPadding,
//     required this.widget,
//   });

//   @override
//   _HoverableAnimatedContainerState createState() =>
//       _HoverableAnimatedContainerState();
// }

// class _HoverableAnimatedContainerState
//     extends State<HoverableAnimatedContainer> {
//   bool _isHovered = false;

//   void _onHover(bool isHovered) {
//     setState(() {
//       _isHovered = isHovered;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;

//     return MouseRegion(
//       onEnter: (_) => _onHover(true),
//       onExit: (_) => _onHover(false),
//       child: AnimatedContainer(
//         height: widget.containerHeight,
//         duration: Duration(milliseconds: 300),
//         child: Stack(
//           children: [
//             Image.asset(
//               widget.imagePath,
//               width: _size.width,
//               fit: BoxFit.cover,
//             ),
//             widget.widget,
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 300),
//               bottom: _isHovered ? widget.hoveredBottom : widget.initialBottom,
//               child: Padding(
//                 padding: widget.textPadding,
//                 child: Text(
//                   widget.text,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class HoverableAnimatedContainer extends StatefulWidget {
  final Widget child;
  final double containerHeight;
  final double initialBottom;
  final double hoveredBottom;
  final HoverableText hoverableText;

  HoverableAnimatedContainer({
    required this.child,
    required this.containerHeight,
    this.initialBottom = -130,
    this.hoveredBottom = 20,
    required this.hoverableText,
  });

  @override
  _HoverableAnimatedContainerState createState() =>
      _HoverableAnimatedContainerState();
}

class _HoverableAnimatedContainerState
    extends State<HoverableAnimatedContainer> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        height: widget.containerHeight,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Stack(
          children: [
            widget.child,
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              bottom: _isHovered ? widget.hoveredBottom : widget.initialBottom,
              left: 0,
              right: 0,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
                child: widget.hoverableText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



 
class HoverableText extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  final TextStyle textStyle;

  HoverableText({
    required this.text,
    this.padding = const EdgeInsets.all(16.0),
    this.textStyle = const TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: textStyle,
      ),
    );
  }
}
