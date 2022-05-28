import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_loyalty/src/config/theme/colors.dart';

import '../../injector.dart';

class MainButtonNabBar extends StatelessWidget {
  const MainButtonNabBar({
    Key? key,
    required this.pageIndex,
    required this.evaIcons,
  }) : super(key: key);

  final int pageIndex;
  final IconData evaIcons;

  @override
  Widget build(BuildContext context) {
    DesignData designData = sl<DesignData>();
    return Container(
      width: 120.w,
      height: 49.h,
      decoration: BoxDecoration(
          color: designData.secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(24.r))),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              evaIcons,
              color: designData.whiteColor,
              size: 24.sp,
            ),
            Text(
              'Home',
              style: TextStyle(fontSize: 15.sp, color: designData.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
