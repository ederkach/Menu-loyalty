import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_loyalty/src/config/theme/colors.dart';

import '../../injector.dart';

class IconButtonNabBar extends StatelessWidget {
  const IconButtonNabBar(
      {Key? key,
      required this.pageIndex,
      required this.evaIcons,
      required this.selectedIndex,
      required this.currentIndex})
      : super(key: key);

  final int pageIndex;
  final IconData evaIcons;
  final Function(int) selectedIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    DesignData designData = sl<DesignData>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            selectedIndex(currentIndex);
          },
          icon: Icon(
            evaIcons,
            color: designData.greyColor,
            size: 24.sp,
          ),
        ),
        if (pageIndex == currentIndex)
          Container(
            height: 7.h,
            width: 7.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: designData.secondaryColor,
            ),
          ),
      ],
    );
  }
}
