import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButtonNabBar extends StatelessWidget {
  const MainButtonNabBar({
    Key? key,
    required this.pageIndex,
    required this.evaIcons,
    required this.title,
  }) : super(key: key);

  final int pageIndex;
  final IconData evaIcons;
  final String title;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Container(
      width: 120.w,
      height: 49.h,
      decoration: BoxDecoration(
          color: designColorScheme.secondary,
          borderRadius: BorderRadius.all(
            Radius.circular(24.r),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              evaIcons,
              color: designColorScheme.onPrimary,
              size: 24.sp,
            ),
            Text(
              title,
              style: designStyleText.bodyMedium?.copyWith(
                  color: designColorScheme.onPrimary, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
