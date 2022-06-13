import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/enums.dart';
import '../../../widgets/green_button.dart';
import '../../../widgets/label_widget.dart';

class CartSum extends StatelessWidget {
  const CartSum({required this.payNow, Key? key}) : super(key: key);

  final Function payNow;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          const LabelWidget(
            label: 'Payment detail',
            darkWhite: DarkWhite.white,
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal ( 3 items)',
                style: designStyleText.bodyText1!.copyWith(
                    fontSize: 15.sp,
                    color:
                        designColorScheme.secondaryContainer.withOpacity(0.7)),
              ),
              Text(
                '\$ 153,00',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 15.sp,
                    color:
                        designColorScheme.secondaryContainer.withOpacity(0.7)),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 15.sp,
                    color:
                        designColorScheme.secondaryContainer.withOpacity(0.7)),
              ),
              Text(
                '\$ 10,00',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 15.sp,
                    color:
                        designColorScheme.secondaryContainer.withOpacity(0.7)),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Prices',
                style: designStyleText.headline6!.copyWith(
                    fontSize: 15.sp, color: designColorScheme.onPrimary),
              ),
              Text(
                '\$ 163,00',
                style: designStyleText.titleLarge!
                    .copyWith(color: designColorScheme.secondary),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: (() => {
                  payNow(),
                }),
            child: const GreenButton(
              title: 'Pay Now',
            ),
          )
        ],
      ),
    );
  }
}
