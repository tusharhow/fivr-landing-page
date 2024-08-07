import 'package:flutter/widgets.dart';

class SquareBox extends StatelessWidget {
  const SquareBox({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      color: color,
    );
  }
}
