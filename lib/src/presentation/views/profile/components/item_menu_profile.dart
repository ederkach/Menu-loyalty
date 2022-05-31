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
    return Container(
      width: 327.w,
      height: 91.h,
      decoration: BoxDecoration(
          color: (!redColor)
              ? Theme.of(context).colorScheme.secondaryContainer
              : Theme.of(context).colorScheme.error.withOpacity(0.1),
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
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.error,
            ),
            child: Icon(
              evaIcons,
              color: Theme.of(context).colorScheme.background,
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
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 17.sp,
                      color: (!redColor)
                          ? Theme.of(context).colorScheme.onSecondary
                          : Theme.of(context).colorScheme.error)),
              if (onSubtitle == true)
                Text(
                  subTitle,
                  style: (!redColor)
                      ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 13.sp,
                          )
                      : Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13.sp,
                          color: Theme.of(context).colorScheme.error),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
