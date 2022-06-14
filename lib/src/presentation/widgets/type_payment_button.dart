import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:menu_loyalty/src/presentation/widgets/dot_widget.dart';

class TypePaymentButton extends StatelessWidget {
  const TypePaymentButton({
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    var designColorScheme = Theme.of(context).colorScheme;
    var designStyleText = Theme.of(context).textTheme;
    var textColorTitle = (isSelected == true)
        ? designColorScheme.onPrimary
        : designColorScheme.onSecondary;
    var textColorSubtitle = (isSelected == true)
        ? designColorScheme.onPrimary
        : designColorScheme.onSecondary.withOpacity(0.5);

    return Container(
      height: 80.h,
      width: 155.w,
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 24.h,
                  width: 40,
                  child: Image.asset('assets/images/MasterCard.png'),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Credit Card',
                      style: (isSelected == true)
                          ? designStyleText.bodyMedium
                              ?.copyWith(color: textColorTitle, fontSize: 15.sp)
                          : designStyleText.bodyMedium?.copyWith(
                              color: textColorTitle, fontSize: 15.sp),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: DotWidget(
                              dotColor: textColorSubtitle,
                              sizeheight: 5,
                              sizewidth: 5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: DotWidget(
                              dotColor: textColorSubtitle,
                              sizeheight: 5,
                              sizewidth: 5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: DotWidget(
                              dotColor: textColorSubtitle,
                              sizeheight: 5,
                              sizewidth: 5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: DotWidget(
                              dotColor: textColorSubtitle,
                              sizeheight: 5,
                              sizewidth: 5),
                        ),
                        Text(
                          '4356',
                          style: (isSelected == true)
                              ? designStyleText.bodyMedium?.copyWith(
                                  color: textColorSubtitle, fontSize: 15.sp)
                              : designStyleText.bodyMedium?.copyWith(
                                  color: textColorSubtitle.withOpacity(0.5),
                                  fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              EvaIcons.checkmarkCircle2,
              color: (isSelected == true)
                  ? designColorScheme.onSecondary
                  : designColorScheme.secondaryContainer,
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: (isSelected == true)
            ? designColorScheme.primary
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
