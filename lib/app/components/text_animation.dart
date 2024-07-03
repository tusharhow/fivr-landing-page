// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Hover Animation Example'),
//         ),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 HoverCard(),
//                 SizedBox(width: 16),
//                 HoverCard(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HoverCard extends StatefulWidget {
//   @override
//   _HoverCardState createState() => _HoverCardState();
// }

// class _HoverCardState extends State<HoverCard> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => _onHover(true),
//       onExit: (_) => _onHover(false),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 300),
//         width: 200,
//         height: 300,
//         decoration: BoxDecoration(
//           color: Colors.blueAccent,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: _isHovered
//               ? [BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 2)]
//               : [],
//         ),
//         child: Stack(
//           children: [
//             AnimatedPositioned(
//               duration: Duration(milliseconds: 300),
//               bottom: _isHovered ? 20 : -60,
//               left: 0,
//               right: 0,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Text(
//                   'Hover Text',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _onHover(bool isHovered) {
//     setState(() {
//       _isHovered = isHovered;
//     });
//   }
// }
