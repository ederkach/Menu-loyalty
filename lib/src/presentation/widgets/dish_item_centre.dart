import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DishItemCentre extends StatelessWidget {
  const DishItemCentre({
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Container(
      height: 155.h,
      width: 155.w,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Cooked with egg Sweet Cookies dr r rjk mjrm jkr',
                        maxLines: 2,
                        style: designStyleText.bodyMedium?.copyWith(
                            color: (isSelected == true)
                                ? designColorScheme.onPrimary
                                : designColorScheme.onSecondary,
                            fontSize: 13.sp),
                      ),
                      Text(
                        '\$51',
                        style: designStyleText.bodyMedium?.copyWith(
                            color: designColorScheme.secondary,
                            fontSize: 15.sp),
                      ),
                    ],
                  ),
                ),
              ),
              width: 155.w,
              height: 90.h,
              decoration: BoxDecoration(
                color: (isSelected == true)
                    ? designColorScheme.primary
                    : designColorScheme.secondaryContainer,
                borderRadius: BorderRadius.all(
                  Radius.circular(24.r),
                ),
              ),
            ),
          ),
          Positioned(
            right: 32,
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/menubonus.appspot.com/o/Replace%20images4.png?alt=media&token=9c18bdee-5c4d-40ce-8d05-4ee61caa7a68',
              width: 88.w,
              height: 88.h,
            ),
          ),
        ],
      ),
    );
  }
}
