import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_loyalty/src/constants/enums.dart';

class ItemPayment extends StatelessWidget {
  const ItemPayment({
    required this.isSelected,
    required this.typePayment,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final TypePayment typePayment;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101.h,
      width: 155.w,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Container(
            height: 101.h,
            width: 155.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  (typePayment == TypePayment.cash)
                      ? EvaIcons.giftOutline
                      : EvaIcons.creditCardOutline,
                  color: (isSelected == true)
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.5),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$15,45',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 15.sp),
                    ),
                    Text(
                      (typePayment == TypePayment.cash) ? 'Cash' : 'Card',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 13.sp),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: (isSelected == true)
                  ? Theme.of(context).colorScheme.onSecondary.withOpacity(0.1)
                  : Theme.of(context).colorScheme.background.withOpacity(0.1),
              borderRadius: BorderRadius.all(
                Radius.circular(24.r),
              ),
            ),
          ),
          if (isSelected == true)
            Positioned(
              right: 10.w,
              top: 10.h,
              child: Icon(EvaIcons.checkmarkCircle2,
                  color: Theme.of(context).colorScheme.secondary),
            )
        ],
      ),
    );
  }
}
