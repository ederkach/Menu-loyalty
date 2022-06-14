import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/categories_offer_model/categories_offer_model.dart';
import 'dot_widget.dart';

class IconMenuButton extends StatelessWidget {
  const IconMenuButton({
    required this.isSelected,
    required this.dotColor,
    required this.categoriesOffer,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final Color dotColor;
  final CategoriesOffer categoriesOffer;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Container(
      height: 90.h,
      width: 155.w,
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (isSelected == true)
            Positioned(
                top: 7.h,
                right: 17.w,
                child: DotWidget(
                  dotColor: dotColor,
                  sizeheight: 9,
                  sizewidth: 9,
                )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIcon(
                AssetImage(categoriesOffer.iconPath),
                color: (isSelected == true)
                    ? designColorScheme.onPrimary
                    : Theme.of(context).iconTheme.color,
                size: 24.sp,
              ),
              Text(
                categoriesOffer.name,
                style: (isSelected == true)
                    ? designStyleText.bodyMedium?.copyWith(
                        color: designColorScheme.secondaryContainer,
                        fontSize: 13.sp)
                    : designStyleText.bodyMedium?.copyWith(
                        color: designColorScheme.onSecondary.withOpacity(0.5),
                        fontSize: 13.sp),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: (isSelected == true)
            ? designColorScheme.secondary
            : designColorScheme.secondaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(32.r)),
        boxShadow: isSelected == true
            ? const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),
                )
              ]
            : null,
      ),
    );
  }
}
