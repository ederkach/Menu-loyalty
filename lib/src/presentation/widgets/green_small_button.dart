import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreenSmallButton extends StatelessWidget {
  const GreenSmallButton({
    required this.isSelected,
    required this.title,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    return Container(
      height: 56.h,
      width: 131.w,
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Center(
        child: Text(
          title,
          style: (isSelected == true)
              ? designStyleText.bodyMedium?.copyWith(
                  color: designColorScheme.onPrimary, fontSize: 13.sp)
              : designStyleText.bodyMedium?.copyWith(
                  color: designColorScheme.onSecondary.withOpacity(0.5),
                  fontSize: 13.sp),
        ),
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
