import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecDishWidget extends StatelessWidget {
  const SpecDishWidget({
    Key? key,
    required this.designStyleText,
    required this.designColorScheme,
  }) : super(key: key);

  final TextTheme designStyleText;
  final ColorScheme designColorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 126.h,
          width: 72.w,
          child: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🔥 kkal 150',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: designStyleText.bodyMedium!.copyWith(
                      fontSize: 14.sp, color: designColorScheme.onPrimary),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Weight 100gr',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: designStyleText.bodyMedium!.copyWith(
                      fontSize: 13.sp, color: designColorScheme.onPrimary),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: designColorScheme.primary,
            borderRadius: BorderRadius.all(
              Radius.circular(26.r),
            ),
          ),
        ),
      ],
    );
  }
}
