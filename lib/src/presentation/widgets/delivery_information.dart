import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryInformation extends StatelessWidget {
  const DeliveryInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Container(
      height: 80.h,
      width: 327.w,
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 48.h,
                  width: 48.w,
                  child:
                      Icon(EvaIcons.pin, color: designColorScheme.onSecondary),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: designColorScheme.secondary,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Andika ( +639384959 )',
                      style: designStyleText.bodyMedium?.copyWith(
                          color: designColorScheme.onSecondary,
                          fontSize: 15.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          'Jalan Pancasila No.1, DIY',
                          style: designStyleText.bodyMedium?.copyWith(
                              color: designColorScheme.onSecondary
                                  .withOpacity(0.5),
                              fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Icon(EvaIcons.editOutline, color: designColorScheme.onSecondary),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: designColorScheme.secondaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(32.r)),
      ),
    );
  }
}
