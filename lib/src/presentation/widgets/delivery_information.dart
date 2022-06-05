import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryInformation extends StatelessWidget {
  const DeliveryInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: Icon(EvaIcons.pin,
                      color: Theme.of(context).colorScheme.onSecondary),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondary,
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
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 15.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          'Jalan Pancasila No.1, DIY',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(0.5),
                                  fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Icon(EvaIcons.editOutline,
                color: Theme.of(context).colorScheme.onSecondary),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(32.r)),
      ),
    );
  }
}
