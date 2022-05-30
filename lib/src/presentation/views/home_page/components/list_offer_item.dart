import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfferItem extends StatelessWidget {
  const ListOfferItem({
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 206.h,
      width: 155.w,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned(
            bottom: 40.h,
            left: 10.w,
            child: SizedBox(
              height: 40.h,
              width: 96.w,
              child: Text(
                'Cooked with egg Sweet Cookies',
                maxLines: 2,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 15.sp),
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 10.w,
            child: Text(
              '\$51',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15.sp),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 155.w,
              height: 135.h,
              decoration: BoxDecoration(
                color: (isSelected == true)
                    ? Theme.of(context).colorScheme.onSecondary.withOpacity(0.1)
                    : Theme.of(context).colorScheme.background.withOpacity(0.1),
                borderRadius: BorderRadius.all(
                  Radius.circular(24.r),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/menubonus.appspot.com/o/Replace%20images4.png?alt=media&token=9c18bdee-5c4d-40ce-8d05-4ee61caa7a68',
              width: 116.w,
              height: 116.w,
            ),
          ),
        ],
      ),
    );
  }
}
