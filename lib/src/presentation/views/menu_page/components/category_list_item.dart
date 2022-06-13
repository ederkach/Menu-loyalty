import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/dot_widget.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return SizedBox(
        width: 108.w,
        child: Column(
          children: [
            Text('Category',
                style: (isSelected)
                    ? designStyleText.bodyMedium!.copyWith(fontSize: 14.sp)
                    : designStyleText.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                        color: designColorScheme.onSecondary.withOpacity(0.5))),
            SizedBox(
              height: 8.h,
            ),
            if (isSelected)
              DotWidget(
                dotColor: designColorScheme.secondary,
                sizeheight: 7,
                sizewidth: 7,
              ),
          ],
        ));
  }
}
