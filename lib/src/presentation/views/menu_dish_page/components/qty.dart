import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/qty_button.dart';

class QtyWidget extends StatelessWidget {
  const QtyWidget({
    Key? key,
    required this.designStyleText,
    required this.designColorScheme,
  }) : super(key: key);

  final TextTheme designStyleText;
  final ColorScheme designColorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QtyButton(
                title: '+',
                background: designColorScheme.secondary,
              ),
              Text(
                '100.5',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: designColorScheme.onSecondary),
              ),
              QtyButton(
                title: '-',
                background: designColorScheme.secondaryContainer,
              ),
            ],
          ),
          Container(
            height: 43.h,
            width: 143.w,
            child: Center(
                child: Text(
              'Try promo code',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: designStyleText.bodyMedium!.copyWith(
                  fontSize: 15.sp, color: designColorScheme.onPrimary),
            )),
            decoration: BoxDecoration(
              color: const Color(0xFFFF9800),
              borderRadius: BorderRadius.all(
                Radius.circular(26.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
