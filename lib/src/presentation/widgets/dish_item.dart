import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/menu_model/menu_model.dart';

class DishItem extends StatelessWidget {
  const DishItem({
    required this.isSelected,
    required this.menuModel,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final MenuModel menuModel;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Container(
      height: 206.h,
      width: 155.w,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned(
            bottom: 38.h,
            left: 15.w,
            child: SizedBox(
              height: 36.h,
              width: 110.w,
              child: Text(
                menuModel.name,
                maxLines: 2,
                style: designStyleText.bodyMedium?.copyWith(
                    color: designColorScheme.onPrimary, fontSize: 13.sp),
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 15.w,
            child: Text(
              '\$51',
              style: designStyleText.bodyMedium?.copyWith(
                  color: designColorScheme.secondary, fontSize: 15.sp),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 155.w,
              height: 135.h,
              decoration: BoxDecoration(
                color: (isSelected == true)
                    ? designColorScheme.onSecondary.withOpacity(0.1)
                    : designColorScheme.background.withOpacity(0.1),
                borderRadius: BorderRadius.all(
                  Radius.circular(24.r),
                ),
              ),
            ),
          ),
          Positioned(
              right: 0,
              child: (menuModel.imagePath.toString() != '')
                  ? Image.network(
                      menuModel.imagePath.toString(),
                      width: 116.w,
                      height: 116.w,
                    )
                  : CircularProgressIndicator(
                      color: designColorScheme.onSecondary,
                    )),
        ],
      ),
    );
  }
}
