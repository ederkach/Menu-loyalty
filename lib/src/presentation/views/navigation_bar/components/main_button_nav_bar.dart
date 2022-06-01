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
    return Container(
      width: 120.w,
      height: 49.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
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
              color: Theme.of(context).scaffoldBackgroundColor,
              size: 24.sp,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }
}
