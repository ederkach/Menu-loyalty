import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: sizeheight.h,
      width: sizewidth.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotColor,
      ),
    );
  }
}
