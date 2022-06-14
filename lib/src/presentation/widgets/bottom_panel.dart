import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({
    required this.width,
    required this.height,
    required this.bottomPanelListWidgets,
    required this.supportWidgets,
    required this.bottomButtonWidgets,
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget bottomButtonWidgets;
  final Widget supportWidgets;
  final Widget bottomPanelListWidgets;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 22.0.h),
        child: Column(
          children: [
            bottomButtonWidgets,
            supportWidgets,
            bottomPanelListWidgets
          ],
        ),
      ),
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: designColorScheme.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
    );
  }
}
