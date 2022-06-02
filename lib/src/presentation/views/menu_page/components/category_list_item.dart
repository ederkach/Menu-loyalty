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
    return SizedBox(
        width: 108.w,
        child: Column(
          children: [
            Text('Category',
                style: (isSelected)
                    ? Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14.sp)
                    : Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(0.5))),
            SizedBox(
              height: 8.h,
            ),
            if (isSelected)
              DotWidget(
                dotColor: Theme.of(context).colorScheme.secondary,
                sizeheight: 7,
                sizewidth: 7,
              ),
          ],
        ));
  }
}
