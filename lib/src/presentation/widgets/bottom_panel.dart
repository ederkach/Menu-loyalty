import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({
    required this.width,
    required this.height,
    required this.bottomPanelListWidgets,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final List<Widget> bottomPanelListWidgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 22.0.h),
        child: Column(
          children: bottomPanelListWidgets,
        ),
      ),
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
    );
  }
}
