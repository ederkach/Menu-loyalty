import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/enums.dart';
import '../../../widgets/label_widget.dart';

class DeliveredTo extends StatelessWidget {
  const DeliveredTo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Container(
      height: 165.h,
      width: 327.w,
      child: Padding(
        padding: EdgeInsets.all(20.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const LabelWidget(label: 'Delevered To', darkWhite: DarkWhite.dark),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  height: 70.w,
                  width: 70.w,
                  child: const Image(
                    image: AssetImage("assets/images/Maps.png"),
                  ),
                ),
                SizedBox(
                  width: 15.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Andika ( +639384959 )'),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      'Jalan Pancasila No.1, DIY',
                      style: designStyleText.headlineMedium?.copyWith(
                          color: designColorScheme.onSecondary.withOpacity(0.5),
                          fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Est : 30 MIN',
                      style: designStyleText.headlineMedium?.copyWith(
                          color: designColorScheme.onSecondary.withOpacity(0.5),
                          fontSize: 15.sp),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: designColorScheme.onPrimary,
        borderRadius: BorderRadius.all(
          Radius.circular(26.r),
        ),
      ),
    );
  }
}
