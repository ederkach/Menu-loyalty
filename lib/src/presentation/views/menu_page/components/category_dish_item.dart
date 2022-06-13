import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryDishItem extends StatelessWidget {
  const CategoryDishItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return SizedBox(
      height: 90.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/menubonus.appspot.com/o/Replace%20images4.png?alt=media&token=9c18bdee-5c4d-40ce-8d05-4ee61caa7a68',
              ),
            ),
            width: 155.w,
            height: 90.h,
            decoration: BoxDecoration(
              color: designColorScheme.secondaryContainer,
              borderRadius: BorderRadius.all(
                Radius.circular(16.r),
              ),
            ),
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
        ],
      ),
    );
  }
}
