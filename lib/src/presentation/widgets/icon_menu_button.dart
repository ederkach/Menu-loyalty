import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dot_widget.dart';

class IconMenuButton extends StatelessWidget {
  const IconMenuButton({
    required this.isSelected,
    required this.dotColor,
    Key? key,
  }) : super(key: key);

  final bool isSelected;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 155.w,
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          if (isSelected == true)
            Positioned(
                top: 5.h,
                right: 15.w,
                child: DotWidget(
                  dotColor: dotColor,
                )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ImageIcon(
                const AssetImage("assets/icons/hamburger.png"),
                color: (isSelected == true)
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).iconTheme.color,
                size: 24.sp,
              ),
              Text(
                'Fast Food',
                style: (isSelected == true)
                    ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontSize: 13.sp)
                    : Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(0.5),
                        fontSize: 13.sp),
              ),
            ],
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: (isSelected == true)
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.all(Radius.circular(32.r)),
        boxShadow: isSelected == true
            ? const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ]
            : null,
      ),
    );
  }
}
