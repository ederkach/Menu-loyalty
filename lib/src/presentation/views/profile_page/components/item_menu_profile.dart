import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemMenuProfile extends StatelessWidget {
  const ItemMenuProfile({
    required this.evaIcons,
    required this.onSubtitle,
    required this.title,
    required this.subTitle,
    required this.redColor,
    Key? key,
  }) : super(key: key);

  final IconData evaIcons;
  final bool onSubtitle;
  final String title;
  final String subTitle;
  final bool redColor;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Container(
      width: 327.w,
      height: 91.h,
      decoration: BoxDecoration(
          color: (!redColor)
              ? designColorScheme.secondaryContainer
              : designColorScheme.error.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(32.r))),
      child: Row(
        children: [
          SizedBox(
            width: 20.w,
          ),
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (!redColor)
                  ? designColorScheme.primary
                  : designColorScheme.error,
            ),
            child: Icon(
              evaIcons,
              color: designColorScheme.background,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: designStyleText.bodyText1?.copyWith(
                      fontSize: 17.sp,
                      color: (!redColor)
                          ? designColorScheme.onSecondary
                          : designColorScheme.error)),
              if (onSubtitle == true)
                Text(
                  subTitle,
                  style: (!redColor)
                      ? designStyleText.bodyMedium?.copyWith(
                          fontSize: 13.sp,
                          color: designColorScheme.onSecondary.withOpacity(0.5))
                      : designStyleText.bodyMedium?.copyWith(
                          fontSize: 13.sp, color: designColorScheme.error),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
