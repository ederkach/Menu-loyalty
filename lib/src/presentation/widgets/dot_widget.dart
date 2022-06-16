import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    required this.dotColor,
    required this.sizeheight,
    required this.sizewidth,
    Key? key,
  }) : super(key: key);

  final Color dotColor;
  final double sizeheight;
  final double sizewidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sizeheight,
      width: sizewidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotColor,
      ),
    );
  }
}
