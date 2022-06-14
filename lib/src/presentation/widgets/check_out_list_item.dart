import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckOutListItem extends StatelessWidget {
  const CheckOutListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return SizedBox(
      width: 327.w,
      height: 74.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/menubonus.appspot.com/o/Replace%20images4.png?alt=media&token=9c18bdee-5c4d-40ce-8d05-4ee61caa7a68',
              ),
            ),
            width: 72.w,
            height: 72.h,
            decoration: BoxDecoration(
              color: designColorScheme.secondaryContainer,
              borderRadius: BorderRadius.all(
                Radius.circular(16.r),
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Orange Panglazed',
                style: designStyleText.bodyMedium!.copyWith(fontSize: 17.sp),
              ),
              Text(
                'Romano cheese',
                style: designStyleText.bodyMedium!.copyWith(
                    fontSize: 13.sp, color: designColorScheme.secondary),
              ),
              Text(
                '\$51,00',
                style: designStyleText.bodyMedium?.copyWith(
                    color: designColorScheme.secondary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            '100.5',
            style: designStyleText.bodyMedium!.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: designColorScheme.onSecondary),
          ),
        ],
      ),
    );
  }
}
