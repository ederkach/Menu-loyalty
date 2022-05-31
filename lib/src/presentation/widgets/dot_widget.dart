import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    required this.dotColor,
    Key? key,
  }) : super(key: key);

  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 7.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dotColor,
      ),
    );
  }
}
